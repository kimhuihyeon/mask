package mask.resolver;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.ModelAndViewContainer;

import mask.common.CommandMap;

//HandlerMethodArgumentResolver 인터페이스를 상속받아 쓰려면 아래의 두개 메서드를 꼭 구현해야함
public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {
	
	//1. supportsParameter 메서드는 Resolver가 적용 가능한지 검사하는 역할
	// +  Controller의 파라미터가 CommandMap 클래스인지 검사할 것!
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}
	
	
	//2. resolverArgument 메서드는 파라미터와 기타 정보를 받아서 실제 객체를 반환하는 역할
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer 
			mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory)
	throws Exception {
		
		// CommandMap 객체 생성.
		CommandMap commandMap = new CommandMap();
		
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();
		
		String key = null; 
		String[] values = null;
		while(enumeration.hasMoreElements()) {   
			key = (String) enumeration.nextElement(); //request에 있는 값을 iterator를 이용하여 하나씩 가져오는 로직임.
			values = request.getParameterValues(key); 
			if(values != null) { //request에 담겨있는 모든 키(key)와 값(value)을 commandMap에 저장
				commandMap.put(key, (values.length > 1) ? values:values[0]);;
			}
			
		}
		return commandMap;
	}// 마지막으로 모든 파라미터가 담겨있는 commandMap을 반환

	

}