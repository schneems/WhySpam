
## mail sent from richard.schneeman@ni.com to 5F06010622FCDF0343DD8@whyspam.me, which should route to admin@whyspam.me
## posfix receives, forwards to postmaster

Aug  6 16:19:59 mail postfix/smtpd[15165]: connect from mailserv97-us.natinst.com[130.164.14.238]
Aug  6 16:19:59 mail postfix/smtpd[15165]: 80F72118174: client=mailserv97-us.natinst.com[130.164.14.238]
Aug  6 16:19:59 mail postfix/cleanup[15169]: 80F72118174: message-id=<OF71FF129F.E2797F19-ON8625760A.00596A8D-8625760A.00598662@ni.com>
Aug  6 16:19:59 mail postfix/qmgr[4153]: 80F72118174: from=<richard.schneeman@ni.com>, size=1973, nrcpt=1 (queue active)
Aug  6 16:19:59 mail postfix/smtpd[15165]: disconnect from mailserv97-us.natinst.com[130.164.14.238]
Aug  6 16:19:59 mail postfix/smtpd[15170]: connect from mailserv97-us.natinst.com[130.164.14.238]
Aug  6 16:19:59 mail postfix/smtpd[15170]: 8ABB4118175: client=mailserv97-us.natinst.com[130.164.14.238]
Aug  6 16:19:59 mail postfix/virtual[15171]: 80F72118174: to=<postmaster@whyspam.me>, orig_to=<5F06010622FCDF0343DD8@whyspam.me>, relay=virtual, delay=0.05, delays=0.03/0.01/0/0.01, dsn=2.0.0, status=sent (delivered to maildir)
Aug  6 16:19:59 mail postfix/qmgr[4153]: 80F72118174: removed

## postfix removes mail from 5F06010622FCDF0343DD8


Aug  6 16:19:59 mail postfix/cleanup[15169]: 8ABB4118175: message-id=<OFC753B5F5.4C196C6A-ON8625760A.0059AA58-8625760A.0059AFB2@ni.com>
Aug  6 16:19:59 mail postfix/qmgr[4153]: 8ABB4118175: from=<richard.schneeman@ni.com>, size=1978, nrcpt=1 (queue active)
Aug  6 16:19:59 mail postfix/smtpd[15170]: disconnect from mailserv97-us.natinst.com[130.164.14.238]
Aug  6 16:19:59 mail postfix/virtual[15171]: 8ABB4118175: to=<postmaster@whyspam.me>, orig_to=<EAF7A28CF1866D0FF79A@WHYSPAM.ME>, relay=virtual, delay=0.05, delays=0.02/0/0/0.02, dsn=2.0.0, status=sent (delivered to maildir)
Aug  6 16:19:59 mail postfix/qmgr[4153]: 8ABB4118175: removed

## doesn't look like the mail ever got sent to admin@whyspam.me

Aug  6 16:20:28 mail pop3d: Connection, ip=[::ffff:216.54.230.114]
Aug  6 16:20:28 mail pop3d: LOGIN, user=admin@whyspam.me, ip=[::ffff:216.54.230.114], port=[3697]
Aug  6 16:20:28 mail pop3d: LOGOUT, user=admin@whyspam.me, ip=[::ffff:216.54.230.114], port=[3697], top=0, retr=0, rcvd=28, sent=118, time=0
Aug  6 16:20:43 mail pop3d: Connection, ip=[::ffff:174.143.236.205]
Aug  6 16:20:43 mail pop3d: LOGIN, user=postmaster@whyspam.me, ip=[::ffff:174.143.236.205], port=[41791]
Aug  6 16:20:43 mail pop3d: LOGOUT, user=postmaster@whyspam.me, ip=[::ffff:174.143.236.205], port=[41791], top=0, retr=8196, rcvd=66, sent=8664, time=0
Aug  6 16:21:43 mail pop3d: Connection, ip=[::ffff:174.143.236.205]
Aug  6 16:21:43 mail pop3d: LOGIN, user=postmaster@whyspam.me, ip=[::ffff:174.143.236.205], port=[53536]
Aug  6 16:21:43 mail pop3d: LOGOUT, user=postmaster@whyspam.me, ip=[::ffff:174.143.236.205], port=[53536], top=0, retr=0, rcvd=12, sent=39, time=0










Last login: Thu Aug  6 10:50:36 on ttys000
richard-schneemans-macbook-pro:~ richardschneeman$ ssh demo@174.143.236.205 -p 30000
demo@174.143.236.205's password: 
Permission denied, please try again.
demo@174.143.236.205's password: 
Permission denied, please try again.
demo@174.143.236.205's password: 



===========================================================

Aug  6 19:29:02 mail postfix/smtpd[15872]: connect from rv-out-0506.google.com[209.85.198.239]
Aug  6 19:29:02 mail postfix/smtpd[15872]: C78B3118174: client=rv-out-0506.google.com[209.85.198.239]
Aug  6 19:29:02 mail postfix/cleanup[15876]: C78B3118174: message-id=<98158704-83E0-4676-8290-3BC7DAC56DE2@gmail.com>
Aug  6 19:29:02 mail postfix/qmgr[4153]: C78B3118174: from=<thedickster@gmail.com>, size=2061, nrcpt=1 (queue active)
Aug  6 19:29:02 mail postfix/virtual[15877]: C78B3118174: to=<postmaster@whyspam.me>, orig_to=<95B588462BF0E549A001@whyspam.me>, relay=virtual, delay=0.23, delays=0.21/0.01/0/0.01, dsn=2.0.0, status=sent (delivered to maildir)
Aug  6 19:29:02 mail postfix/qmgr[4153]: C78B3118174: removed
Aug  6 19:29:33 mail postfix/smtpd[15872]: disconnect from rv-out-0506.google.com[209.85.198.239]
Aug  6 19:29:50 mail pop3d: Connection, ip=[::ffff:174.143.236.205]
Aug  6 19:29:50 mail pop3d: LOGIN, user=postmaster@whyspam.me, ip=[::ffff:174.143.236.205], port=[39030]
Aug  6 19:29:50 mail pop3d: LOGOUT, user=postmaster@whyspam.me, ip=[::ffff:174.143.236.205], port=[39030], top=0, retr=4286, rcvd=42, sent=4546, time=0



===================================



File: /home/vmail/whyspam.me/postmaster/new/1249586942.V801Ib0309M965340.mail.whyspam.me                                                             

Return-Path: <thedickster@gmail.com>
X-Original-To: 95B588462BF0E549A001@whyspam.me
Delivered-To: postmaster@whyspam.me
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.239])
        by mail.whyspam.me (Postfix) with ESMTP id C78B3118174
        for <95B588462BF0E549A001@whyspam.me>; Thu,  6 Aug 2009 19:29:02 +0000 (UTC)
Received: by rv-out-0506.google.com with SMTP id b25so228453rvf.51
        for <95B588462BF0E549A001@whyspam.me>; Thu, 06 Aug 2009 12:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to
         :content-type:content-transfer-encoding:mime-version:subject:date
         :x-mailer;
        bh=qHAdHeJvm9xNIvBp0cyxm6DA61XLBIqwosiwXqrR2QE=;
        b=kRJB+0t+qTiJmeqMmmDRiHKPbqPOc4xFUzqBlbC6L5sWt20/WvVJhbS525tCwGUhvj
         oxztMA3lXD9QbljnMyniwwpGgyYCPkRgNlNC45qzW9WSRXaB+HSmccvqjzyEDghIGG73
         cqBwi+jWgN3bgjwq+NvsTf5G9Q+xyejZxZmm8=
DomainKey-Signature: a=rsa-sha1; c=nofws;
        d=gmail.com; s=gamma;
        h=message-id:from:to:content-type:content-transfer-encoding
         :mime-version:subject:date:x-mailer;
        b=OcERPtqeOnxeooJFjHMpkQmKLXF2NTk3gSIqDZ5r0RDWDMLCXiSSGjaV/GzQsZ2w0r
         BywoZ3JNkztLB2Qob+JqVYTxsHqEkoKXbxU/hqDqRoBFW6fxRZcgi88m5VN9TQ5m8RT0
         K4+yS0wqnpaRAOfJZCCLjeAr8xqF3pK8qzvZ0=
Received: by 10.140.132.9 with SMTP id f9mr95435rvd.234.1249586942208;
        Thu, 06 Aug 2009 12:29:02 -0700 (PDT)
        Received: from ?192.168.10.168? (216-54-230-114.static.twtelecom.net [216.54.230.114])
                by mx.google.com with ESMTPS id l31sm1459615rvb.14.2009.08.06.12.29.01         
                (version=TLSv1/SSLv3 cipher=RC4-MD5);
                Thu, 06 Aug 2009 12:29:01 -0700 (PDT)
        Message-Id: <98158704-83E0-4676-8290-3BC7DAC56DE2@gmail.com>
        From: Richard Schneeman <thedickster@gmail.com>
        To: 95B588462BF0E549A001@WHYSPAM.ME
        Content-Type: text/plain; charset=US-ASCII; format=flowed
        Content-Transfer-Encoding: 7bit
        Mime-Version: 1.0 (Apple Message framework v935.3)
        Subject: hey kiddo
        Date: Thu, 6 Aug 2009 14:29:00 -0500
        X-Mailer: Apple Mail (2.935.3)

        how goes it?




