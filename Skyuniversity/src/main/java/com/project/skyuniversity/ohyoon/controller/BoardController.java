package com.project.skyuniversity.ohyoon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.ohyoon.service.InterOhyoonService;

//=== #30. 컨트롤러 선언 === 
@Component
/* XML에서 빈을 만드는 대신에 클래스명 앞에 @Component 어노테이션을 적어주면 해당 클래스는 bean으로 자동 등록된다. 
그리고 bean의 이름(첫글자는 소문자)은 해당 클래스명이 된다. 
즉, 여기서 bean의 이름은 boardController 이 된다. 
여기서는 @Controller 를 사용하므로 @Component 기능이 이미 있으므로 @Component를 명기하지 않아도 BoardController 는 bean 으로 등록되어 스프링컨테이너가 자동적으로 관리해준다. 
*/
@Controller
public class BoardController {

	// === #35. 의존객체 주입하기(DI: Dependency Injection) ===
		// ※ 의존객체주입(DI : Dependency Injection) 
		//  ==> 스프링 프레임워크는 객체를 관리해주는 컨테이너를 제공해주고 있다.
		//      스프링 컨테이너는 bean으로 등록되어진 BoardController 클래스 객체가 사용되어질때, 
		//      BoardController 클래스의 인스턴스 객체변수(의존객체)인 BoardService service 에 
		//      자동적으로 bean 으로 등록되어 생성되어진 BoardService service 객체를  
		//      BoardController 클래스의 인스턴스 변수 객체로 사용되어지게끔 넣어주는 것을 의존객체주입(DI : Dependency Injection)이라고 부른다. 
		//      이것이 바로 IoC(Inversion of Control == 제어의 역전) 인 것이다.
		//      즉, 개발자가 인스턴스 변수 객체를 필요에 의해 생성해주던 것에서 탈피하여 스프링은 컨테이너에 객체를 담아 두고, 
		//      필요할 때에 컨테이너로부터 객체를 가져와 사용할 수 있도록 하고 있다. 
		//      스프링은 객체의 생성 및 생명주기를 관리할 수 있는 기능을 제공하고 있으므로, 더이상 개발자에 의해 객체를 생성 및 소멸하도록 하지 않고
		//      객체 생성 및 관리를 스프링 프레임워크가 가지고 있는 객체 관리기능을 사용하므로 Inversion of Control == 제어의 역전 이라고 부른다.  
		//      그래서 스프링 컨테이너를 IoC 컨테이너라고도 부른다.
		
		//  IOC(Inversion of Control) 란 ?
		//  ==> 스프링 프레임워크는 사용하고자 하는 객체를 빈형태로 이미 만들어 두고서 컨테이너(Container)에 넣어둔후
		//      필요한 객체사용시 컨테이너(Container)에서 꺼내어 사용하도록 되어있다.
		//      이와 같이 객체 생성 및 소멸에 대한 제어권을 개발자가 하는것이 아니라 스프링 Container 가 하게됨으로써 
		//      객체에 대한 제어역할이 개발자에게서 스프링 Container로 넘어가게 됨을 뜻하는 의미가 제어의 역전 
		//      즉, IOC(Inversion of Control) 이라고 부른다.
		
		
		//  === 느슨한 결합 ===
		//      스프링 컨테이너가 BoardController 클래스 객체에서 BoardService 클래스 객체를 사용할 수 있도록 
		//      만들어주는 것을 "느슨한 결합" 이라고 부른다.
		//      느스한 결합은 BoardController 객체가 메모리에서 삭제되더라도 BoardService service 객체는 메모리에서 동시에 삭제되는 것이 아니라 남아 있다.
		
		// ===> 단단한 결합(개발자가 인스턴스 변수 객체를 필요에 의해서 생성해주던 것)
		// private InterBoardService service = new BoardService(); 
		// ===> BoardController 객체가 메모리에서 삭제 되어지면  BoardService service 객체는 멤버변수(필드)이므로 메모리에서 자동적으로 삭제되어진다.	
		
		@Autowired     // Type에 따라 알아서 Bean 을 주입해준다.
		private InterOhyoonService service;
		
		// === 게시판 리스트 페이지 요청 === // 
		@RequestMapping(value="/boardList.sky")
		public ModelAndView boardList(ModelAndView mav) {
			mav.setViewName("/board/boardList.tiles1");
			return mav;
		}
		
		
		// === 게시판 등록 페이지 요청 === // 
		@RequestMapping(value="/boardRegister.sky")
		public ModelAndView boardRegister(ModelAndView mav) {
			mav.setViewName("/board/boardRegister.tiles1");
			return mav;
		}
		
		
		
		
	
}
