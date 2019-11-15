import com.google.gson.Gson;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspApplicationContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

class ReplyContent{
    public String name;
    public String msg;
    ReplyContent(String name,String msg){
        this.name = name;
        this.msg = msg;
    }
}

@WebServlet(name="reply",urlPatterns={"/reply"})
public class reply extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        ServletContext context = getServletContext();
        ArrayList<ReplyContent> arr = (ArrayList<ReplyContent>)context.getAttribute("reply");
        String json = new Gson().toJson(arr);
        out.println(json);
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        ReplyContent rep = new ReplyContent(req.getParameter("username"),req.getParameter("replyContent"));
        ServletContext context = getServletContext();
        ArrayList<ReplyContent> arr = (ArrayList<ReplyContent>) context.getAttribute("reply");
        if(arr == null){
            arr = new ArrayList<>();
        }
        arr.add(rep);
        while(arr.size()>100){
            arr.remove(0);
        }
        context.setAttribute("reply",arr);
        resp.sendRedirect("./index");
    }
}