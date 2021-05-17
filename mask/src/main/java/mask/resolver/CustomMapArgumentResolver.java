package mask.resolver;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.ModelAndViewContainer;

import mask.common.CommandMap;

//HandlerMethodArgumentResolver �������̽��� ��ӹ޾� ������ �Ʒ��� �ΰ� �޼��带 �� �����ؾ���
public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {
	
	//1. supportsParameter �޼���� Resolver�� ���� �������� �˻��ϴ� ����
	// +  Controller�� �Ķ���Ͱ� CommandMap Ŭ�������� �˻��� ��!
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}
	
	
	//2. resolverArgument �޼���� �Ķ���Ϳ� ��Ÿ ������ �޾Ƽ� ���� ��ü�� ��ȯ�ϴ� ����
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer 
			mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory)
	throws Exception {
		
		// CommandMap ��ü ����.
		CommandMap commandMap = new CommandMap();
		
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();
		
		String key = null; 
		String[] values = null;
		while(enumeration.hasMoreElements()) {   
			key = (String) enumeration.nextElement(); //request�� �ִ� ���� iterator�� �̿��Ͽ� �ϳ��� �������� ������.
			values = request.getParameterValues(key); 
			if(values != null) { //request�� ����ִ� ��� Ű(key)�� ��(value)�� commandMap�� ����
				commandMap.put(key, (values.length > 1) ? values:values[0]);;
			}
			
		}
		return commandMap;
	}// ���������� ��� �Ķ���Ͱ� ����ִ� commandMap�� ��ȯ

	

}