<%@ page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>


<%
      String saveFile = "";
      String contentType = request.getContentType();
      if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();


            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            //out.println(file);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));

            //title fetching
            int titlepos=file.indexOf("title");
            String tit=file.substring(titlepos+6);
            int titleend=tit.indexOf("-----");
            out.println(tit.substring(0,titleend));
            String title=tit.substring(0,titleend);

            //category fetching
            titlepos=file.indexOf("category");
             tit=file.substring(titlepos+9);
             titleend=tit.indexOf("-----");
            out.println(tit.substring(0,titleend));
            String category=tit.substring(0,titleend);

            //price fetching
            titlepos=file.indexOf("price");
             tit=file.substring(titlepos+6);
             titleend=tit.indexOf("-----");
            out.println(tit.substring(0,titleend));
            String price=tit.substring(0,titleend);

            //description
            titlepos=file.indexOf("description");
             tit=file.substring(titlepos+12);
             titleend=tit.indexOf("-----");
            out.println(tit.substring(0,titleend));
            String description=tit.substring(0,titleend);



          // out.println(saveFile);


      //      saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));

             saveFile = saveFile.substring(0, saveFile.indexOf("\""));


           // out.println(saveFile);

            int lastIndex = contentType.lastIndexOf("=");


          //  out.println(contentType);
            String boundary = contentType.substring(lastIndex + 1, contentType.length());

          //  out.println(boundary);
            int pos;
            pos = file.indexOf("filename=\"");

           // out.println(file.substring(pos));
            //out.println(pos);

            pos = file.indexOf("\n", pos) + 1;

           // out.println(pos);

            pos = file.indexOf("\n", pos) + 1;

         //   out.println(pos);

            pos = file.indexOf("\n", pos) + 1;

           // out.println("Sriram    "+file.substring(0,pos));
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
            String filename=saveFile;
            
            String user = (String)session.getAttribute("user");
           out.println(user);
      
            saveFile = "D:/Apache Software Foundation/Tomcat 9.0/webapps/olx/images/" +user+"_"+ saveFile;

            File ff = new File(saveFile);
            FileOutputStream fileOut = new FileOutputStream(ff);
            fileOut.write(dataBytes, startPos, (endPos - startPos));


            java.util.Date dt = new java.util.Date();

            java.text.SimpleDateFormat sdf = 
            new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            String currentTime = sdf.format(dt);

            String currentdate=currentTime.substring(0,10);
            String currenttime=currentTime.substring(11);

            out.println(currentdate);
            out.println(currenttime);
            saveFile =saveFile.substring(53);
            out.println(saveFile);

          //  out.println(startPos+" "+endPos+"\n");

          //  out.println(file.substring(endPos));

            fileOut.flush();
            fileOut.close();
            try
            {
            Connection con = ConnectionManager.getConnection();
            ResultSet rs;
        Statement stmt1;
        int id;
        String sql="select count(*) as c from uploadedfiles";
        stmt1=con.createStatement();
        rs=stmt1.executeQuery(sql);
        int count=0;
        while(rs.next())
        count++;
        if(count==0)
        id=1;
        else
        {
          sql="select max(id) as maxid from uploadedfiles ";
          rs=stmt1.executeQuery(sql);
          rs.next();
          count=rs.getInt("maxid");
          id=count+1;
        }
        String ids=Integer.toString(id);

        PreparedStatement stmt=con.prepareStatement("insert into uploadedfiles values(?,?,?,?,?,?,?,?,?,?)");
        stmt.setString(1,ids);
        stmt.setString(2,user);
        stmt.setString(3,saveFile);
        stmt.setString(4,currentdate);
        stmt.setString(5,currenttime);
        stmt.setString(6,title);
        stmt.setString(7,price);
        stmt.setString(8,category);
        stmt.setString(9,description);
        stmt.setString(10,"0");
        stmt.executeUpdate();
        stmt.close();
        response.sendRedirect("userwelcome.jsp");
        con.close();
        }
        catch(Exception e)
        {
            out.println(e);
            
        }



%><Br>
<style>
      td,tr
      {
            padding: 20px;

      }
</style>
<table border="2">
      <tr>
            <td><b>You have successfully upload the file by the name of:</b>
            <%
                  out.println(saveFile);
                  out.println(filename);
                 // out.println(formDataLength);
                 // out.println(file.substring(file.indexOf("filename=\"") +10));
                  }
            %>
            </td>
      </tr>
</table>

 
