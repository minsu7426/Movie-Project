package aop;

import java.lang.reflect.Method;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAop {

	private Logger log = LoggerFactory.getLogger(getClass());

//	@Pointcut("execution(* controller..*.*(..))")
//	private void cut() {
//	}

	@Before("execution(* controller..*.*(..)) || execution(* adminController..*.*(..))")
	public void aroundParameterLog(JoinPoint joinPoint) {
		// 메서드 정보 받기
		Method method = getMethod(joinPoint);
		log.info("======= {} =======", joinPoint.getSignature());
		log.info("method name = {}", method.getName());
		
		Object[] args = joinPoint.getArgs();
		if (args.length <= 0) {
			log.info("no parameter");
		}
		for(Object arg : args) {
			if(arg == null) {
				continue;
			}
			log.info("parameter type = {}", arg.getClass().getSimpleName());
			log.info("parameter value = {}", arg);
		}
	}
	
//	@Before("execution(* controller..*.*(..))")
//	public void beforeParameterLog(JoinPoint joinPoint) {
//		// 메서드 정보 받기
//		Method method = getMethod(joinPoint);
//		log.info("======= method name = {} =======", method.getName());
//
//		Object[] args = joinPoint.getArgs();
//		if (args.length <= 0) {
//			log.info("no parameter");
//		}
//		for(Object arg : args) {
//			log.info("parameter type = {}", arg.getClass().getSimpleName());
//			log.info("parameter value = {}", arg);
//		}
//	}
//	
//    @AfterReturning(value = "execution(* controller..*.*(..))", returning = "returnObj")
//    public void afterReturnLog(JoinPoint joinPoint, Object returnObj) {
//        // 메서드 정보 받아오기
//        Method method = getMethod(joinPoint);
//        log.info("======= method name = {} =======", method.getName());
//
//        log.info("return type = {}", returnObj.getClass().getSimpleName());
//        log.info("return value = {}", returnObj);
//    }


	public Method getMethod(JoinPoint joinPoint) {
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		return signature.getMethod();
	}
	
	
}
