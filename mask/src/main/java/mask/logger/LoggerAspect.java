package mask.logger;


import org.apache.commons.logging.Log; 
import org.apache.commons.logging.LogFactory; 
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around; 
import org.aspectj.lang.annotation.Aspect;

@Aspect //Aspect 어노테이션을 선언하여 해당 클래스가 Aspect Bean 객체임을 선언.
public class LoggerAspect
{protected Log log = LogFactory.getLog(LoggerAspect.class);
static String name = "";
static String type = "";

//execution(수식어패턴 리턴타입패턴 클래스이름패턴 메서드이름패턴(파라미터패턴)) 형식
@Around("execution(* mask..controller.*Controller.*(..)) or execution(* first..service.*Impl.*(..)) or execution(* first..dao.*DAO.*(..))") 
/*mask.. -> 패키지 및 하위 패키지 *Controller.* -> Controller로 끝나는 클래스의 모든 메서드 
(..) -> 모든 파라미터 패턴  나머지 dao service도 비슷한 방식으로 해석하기!*/

	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
type = joinPoint.getSignature().getDeclaringTypeName();

//if - else if을 이용하여 한계없이 뽑아내는 로직

if(type.indexOf("Controller") > -1) {
	name = "Controller \t: ";
}
else if(type.indexOf("Service") > -1) {
	name = "ServiceImpl \t: ";
}

else if(type.indexOf("DAO") > -1) {
	name = "DAO \t\t: ";
}

log.debug(name + type + "." + joinPoint.getSignature().getName() + "()");
return joinPoint.proceed(); 

}
}
