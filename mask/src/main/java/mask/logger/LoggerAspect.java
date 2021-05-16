package mask.logger;


import org.apache.commons.logging.Log; 
import org.apache.commons.logging.LogFactory; 
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around; 
import org.aspectj.lang.annotation.Aspect;

@Aspect //Aspect ������̼��� �����Ͽ� �ش� Ŭ������ Aspect Bean ��ü���� ����.
public class LoggerAspect
{protected Log log = LogFactory.getLog(LoggerAspect.class);
static String name = "";
static String type = "";

//execution(���ľ����� ����Ÿ������ Ŭ�����̸����� �޼����̸�����(�Ķ��������)) ����
@Around("execution(* mask..controller.*Controller.*(..)) or execution(* first..service.*Impl.*(..)) or execution(* first..dao.*DAO.*(..))") 
/*mask.. -> ��Ű�� �� ���� ��Ű�� *Controller.* -> Controller�� ������ Ŭ������ ��� �޼��� 
(..) -> ��� �Ķ���� ����  ������ dao service�� ����� ������� �ؼ��ϱ�!*/

	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
type = joinPoint.getSignature().getDeclaringTypeName();

//if - else if�� �̿��Ͽ� �Ѱ���� �̾Ƴ��� ����

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
