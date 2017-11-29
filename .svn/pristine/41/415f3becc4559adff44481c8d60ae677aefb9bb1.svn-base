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

import util.ConfigUtil;

public class ConfigFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res =(HttpServletResponse)response;

		
		//进入过滤链
		chain.doFilter(request, response);
		
		

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		ConfigUtil.initAllConfig();
	}

}
