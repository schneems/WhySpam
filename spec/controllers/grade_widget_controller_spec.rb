require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GradeWidgetController do
  integrate_views
  describe "Checked" do
     it "should render widget" do
       get :checked
       response.should render_template("_checked")
     end
   end
   
   describe "Validated" do
      it "should render widget" do
        get :validated
        response.should render_template("_validated")
      end
    end
  
  
  describe "SHOW /show/id" do
    before(:each) do
      @website = Factory.create(:website, :url => "blah.com", :grade => "B")
    end
    
    it "should render widget" do
      get :show, :url => "foo.com"
      response.should render_template("_show")
    end
    
    it "should show checked if checked is true" do
      get :show, :url => "foo.com", :checked => "true"
     # render 'grade_widget/_show.html.erb'
      
      response.should_not have_tag("img[alt='Aplusvalid']")
      response.should have_tag("img[alt='Checked']")
    end
    
    it "should show validated if checked is false" do
      @website.grade = "A+" 
      @website.save
      get :show, :url => @website.url , :checked => "false"
      assigns[:myurl].should == "blah.com"
      assigns[:image].should == "widgets/aplusvalid.png"
    end
    
    
    it "should show A+" do
      @website.grade = "A+" 
      @website.save
      get :show, :url => @website.url , :checked => "false"
      assigns[:myurl].should == "blah.com"
      assigns[:image].should == "widgets/aplusvalid.png"
      response.should have_text(/blah\.com/)
    end
    
    it "should show A-" do
      @website.grade = "A-" 
      @website.save
      get :show, :url => @website.url , :checked => "false"
      assigns[:myurl].should == "blah.com"
      assigns[:image].should == "widgets/avalid.png"
      response.should have_text(/blah\.com/)
    end
    
    it "should show B" do
      @website.grade = "B" 
      @website.save
      get :show, :url => @website.url , :checked => "false"
      assigns[:myurl].should == "blah.com"
      assigns[:image].should == "widgets/bvalid.png"
      response.should have_text(/blah\.com/)
    end
    
    it "should show C" do
      @website.grade = "C" 
      @website.save
      get :show, :url => @website.url , :checked => "false"
      assigns[:image].should == "widgets/cvalid.png"
    end
    
    it "should show D" do
      @website.grade = "D" 
      @website.save
      get :show, :url => @website.url , :checked => "false"
      assigns[:image].should == "widgets/dvalid.png"
    end
    
    it "should showF" do
      @website.grade = "F" 
      @website.save
      get :show, :url => @website.url , :checked => "false"
      assigns[:image].should == "widgets/fvalid.png"
    end
    
    it "should show NA" do
      @website.grade = "NA" 
      @website.save
      get :show, :url => @website.url , :checked => "false"
      assigns[:image].should == "widgets/checked.png"
    end
    
    
    
    it "should show checked by default" do
      @website = Factory.create(:website, :url => "blah.com", :grade => "zz")
      
      get :show, :url => @website.url , :checked => "false"
      assigns[:myurl].should == "blah.com"
      assigns[:image].should == "widgets/bvalid.png"
      response.should have_text(/blah\.com/)
    end
    
  end
  
  
  describe "NEW /grade_widget/new" do
    it "should render a widget form" do
      get :new 
      response.should render_template("new")
    end
  end
  
  describe "CREATE /grade_widget" do
    it "should render create" do
      post :create , :website => "http://www.foo.com", :displaytype => "false"
      response.should render_template("create")
    end
    
    it "should render a validate widget" do
      post :create , :website => "http://www.foo.com", :displaytype => "notchecked"
      assigns[:boolean].should == "false" # false renders validated, true renders only checked
      assigns[:website].should == "foo.com"      
      response.should have_tag("img[alt='Checked']")
      response.should have_tag("img[alt='Aplusvalid']")
    end
    
      it "should render a checked only widget" do
         post :create , :website => "http://www.foo.com", :displaytype => "checked"
         assigns[:boolean].should == "true" # false renders validated, true renders only checked
         assigns[:website].should == "foo.com"
         response.should_not have_tag("img[alt='Avalid']")
         response.should have_tag("img[alt='Checked']")
      end
    
    
    
  end
  

end