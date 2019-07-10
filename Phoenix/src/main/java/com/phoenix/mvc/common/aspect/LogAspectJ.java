package com.phoenix.mvc.common.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/*
 * FileName : PojoAspectJ.java
 *	:: XML 에 선언적으로 aspect 의 적용   
  */
@Aspect
@Component
public class LogAspectJ {
	///Constructor
	public LogAspectJ() {
		System.out.println("\nCommon :: "+this.getClass()+"\n");
	}
	
	//Around  Advice
	@Around("execution(* com.phoenix.mvc.service..*Impl.*(..) )")
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
			
		System.out.println("");
		System.out.println("[Around before] 타겍객체.메서드 :"+
													joinPoint.getTarget().getClass().getName() +"."+
													joinPoint.getSignature().getName());
		if(joinPoint.getArgs().length !=0){
			System.out.println("[Around before]method에 전달되는 인자 : "+ joinPoint.getArgs()[0] + "\n");
		}
		
		
		//==> 타겟 객체의 Method 를 호출 하는 부분 
		Object obj = joinPoint.proceed();

		System.out.println("[Around after] 타겍객체.메서드 :"+
				joinPoint.getTarget().getClass().getName() +"."+
				joinPoint.getSignature().getName());
		System.out.println("[Around after] 타겟 객체return value  : "+ obj + "\n");
		
		return obj;
	}
	
}//end of class