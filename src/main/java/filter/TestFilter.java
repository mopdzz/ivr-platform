package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestFilter
        implements Filter {
    private FilterConfig config;

    static {
        int a = 100;
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws ServletException, IOException {
        HttpServletRequest hreq = (HttpServletRequest) req;
        HttpServletResponse hres = (HttpServletResponse) res;
        HttpSession session = hreq.getSession();
        String name = hreq.getParameter("name");
        String password = hreq.getParameter("password");
        String theName = (String) session.getAttribute("thename");
        String thePassword = (String) session.getAttribute("thePassword");

        if ((theName == null) || (theName.equals("")) ||
                (thePassword == null) || (thePassword.equals(""))) {
            hres.sendRedirect("index.jsp");
            return;
        }

        chain.doFilter(req, res);
    }

    public void init(FilterConfig config) {
        this.config = config;
    }

    public void destroy() {
        this.config = null;
    }
}
