package aop;

import java.lang.reflect.Method;
import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAop {

	private static final Logger logger = LoggerFactory.getLogger(LogAop.class);

//	@Pointcut("execution(* controller..*.*(..))")
//	private void cut() {
//	}

	@Before("execution(* controller..*.*(..)) || execution(* adminController..*.*(..))")
	public void aroundParameterLog(JoinPoint joinPoint) {
		// 메서드 정보 받기
		Method method = getMethod(joinPoint);
		logger.info("1: {}", joinPoint.getSignature());
		logger.info("2: method = {}", method.getName());
		logger.info("3: "+Arrays.toString(joinPoint.getArgs()));
//		Object[] args = joinPoint.getArgs();
//		if (args.length <= 0) {
//			logger.info("no parameter");
//		}
//		for(Object arg : args) {
//			if(arg == null) {
//				continue;
//			}
//			logger.info("3: parameter type = {}", arg.getClass().getSimpleName());
//			logger.info("4: parameter value = {}", arg);
//		}
	}
	
//	@Before("execution(* controller..*.*(..))")
//	public void beforeParameterLog(JoinPoint joinPoint) {
//		// 메서드 정보 받기
//		Method method = getMethod(joinPoint);
//		logger.info("======= method name = {} =======", method.getName());
//
//		Object[] args = joinPoint.getArgs();
//		if (args.length <= 0) {
//			logger.info("no parameter");
//		}
//		for(Object arg : args) {
//			logger.info("parameter type = {}", arg.getClass().getSimpleName());
//			logger.info("parameter value = {}", arg);
//		}
//	}
//	
//    @AfterReturning(value = "execution(* controller..*.*(..))", returning = "returnObj")
//    public void afterReturnLog(JoinPoint joinPoint, Object returnObj) {
//        // 메서드 정보 받아오기
//        Method method = getMethod(joinPoint);
//        logger.info("======= method name = {} =======", method.getName());
//
//        logger.info("return type = {}", returnObj.getClass().getSimpleName());
//        logger.info("return value = {}", returnObj);
//    }


	public Method getMethod(JoinPoint joinPoint) {
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		return signature.getMethod();
	}
	
	
}
