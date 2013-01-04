<HTML>
<%@ page import="javax.mail.*, javax.mail.internet.*, java.util.*" %>
<%
  try {
    String mailServer = "devmail.dev.tivoli.com";
    String subject = request.getParameter("subject");
    String[] to = { request.getParameter("to") };
    String from = request.getParameter("from");
    String body = request.getParameter("destination") +
      "\n\n" + request.getParameter("body");
    sendEmail(mailServer, subject, to, from, body);
 %>
<body>
<P> Mail has been sent! </P>
<% }
  catch (AddressException e) { %>
<P>Invalid e-mail address(es) for forwarding</P>
<% }
  catch (MessagingException e) { %>
<P>Unable to send e-mail notification</P>
<% } %>

Return to
<a href="<%= request.getParameter("destination") %>">Original Page</a>
</body>
</html>
<%!
  public void sendEmail (String mailServer, String subject,
                         String to[], String from, String messageText) 
    throws AddressException, MessagingException {
    // Create session
    Properties mailProps = new Properties();
    mailProps.put("mail.smtp.host", mailServer);
    Session mailSession = Session.getDefaultInstance(mailProps, null);
    // Construct addresses
    int toCount = to.length;
    InternetAddress[] toAddrs = new InternetAddress[toCount];
    for (int i = 0; i < toCount; ++i) {
        toAddrs[i] = new InternetAddress(to[i]);
    }
    InternetAddress fromAddr = new InternetAddress(from);
    // Create and initialize message
    Message message = new MimeMessage(mailSession);
    message.setFrom(fromAddr);
    message.setRecipients(Message.RecipientType.TO, toAddrs);
    message.setSubject(subject);
    message.setContent(messageText.toString(), "text/plain");
    // Send message
    Transport.send(message);
  }
%>
