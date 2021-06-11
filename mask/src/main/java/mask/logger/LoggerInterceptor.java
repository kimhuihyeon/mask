package mask.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoggerInterceptor extends HandlerInterceptorAdapter{
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	
  /*preHandle �޼���� postHandle �޼��带 �̿��� ��ó���� �� ��ó���� 
	preHandle�� ��� ��Ʈ�ѷ��� ȣ��Ǳ� ���� ����!
	postHandle�� ��� ��Ʈ�ѷ��� ȣ��� �� ����!*/
	
//START - END
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception { 
	 if(log.isDebugEnabled()) { 
			log.debug("======================================          START         ======================================");
			log.debug(" Request URI \t: " + request.getRequestURI());
		}
		 
		return super.preHandle(request, response, handler);
		
	}
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception { 
		if(log.isDebugEnabled()) { 
			log.debug("======================================          END        ======================================\n");
		
		}
		
		
	}
	
	
	
	

}
