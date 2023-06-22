#!/usr/bin python3

import cgi

# Parse the query parameters
form = cgi.FieldStorage()

# Extract the values from the parameters
game = form.getvalue('game')
ver = form.getvalue('ver')
country = form.getvalue('country')
mac = form.getvalue('mac')
ip = form.getvalue('ip')
nesys_tenpo_name = form.getvalue('nesys_tenpo_name')
nesys_tenpo_addr = form.getvalue('nesys_tenpo_addr')
cmd = form.getvalue('cmd')

# Add your logic or further processing here
# ...

# Print the response headers
print("Content-type: text/html")
print()

# Print the response body
print("<html>")
print("<head>")
print("<title>CGI Script Response</title>")
print("</head>")
print("<body>")
print("<h1>CGI Script Response</h1>")
print("<p>Received parameters:</p>")
print("<ul>")
print("<li>Game: {}</li>".format(game))
print("<li>Version: {}</li>".format(ver))
print("<li>Country: {}</li>".format(country))
print("<li>MAC Address: {}</li>".format(mac))
print("<li>IP Address: {}</li>".format(ip))
print("<li>Store Name: {}</li>".format(nesys_tenpo_name))
print("<li>Store Address: {}</li>".format(nesys_tenpo_addr))
print("<li>Command: {}</li>".format(cmd))
print("</ul>")
print("</body>")
print("</html>")
