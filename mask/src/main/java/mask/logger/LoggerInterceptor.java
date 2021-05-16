package mask.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoggerInterceptor extends HandlerInterceptorAdapter{
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	
  /*preHandle 메서드와 postHandle 메서드를 이용해 전처리기 및 후처리기 
	preHandle의 경우 컨트롤러가 호출되기 전에 실행!
	postHandle의 경우 컨트롤러가 호출된 후 실행!*/
	
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
