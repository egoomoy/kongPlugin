# kong, 콩 api gw 의 custom plugin (커스텀 플러그인) 배포 a-Z 가이드

**0. 개발환경**

- mac/minikube
- brew를 통해 기본적인 kubectl, minikube를 사용할 줄 알아야한다.

**1. minikube**

- brew install minikube kubectl 등.. 필요한 것 설치
- minikube start (minikube stop && minikube delete --all && minikube start)
- minikube dashboard
- minikube tunnel => loadbalancer 를 로컬호스트로 사용하기 위함

**2. pluging 배포**

- 기본적으로 kong의 플러그인은 lua로 작성된다.
- 공식 docs를 참고하면 response header에 값을 돌려주는 플러그인을 만들 수 있다.
- 1번 폴더 참고
- kubectl create namespace kong
- kubectl create configmap kong-plugin-myheader --from-file=myheader -n kong

**3. upstreamAPI 배포**

- 테스트용 API서버를 배포한다.
- 패스트캠퍼스의 권윤정(카카오페이)님 감사합니다. 강의도 잘 들었고, 정말 많이 배웠어요
- 2번 폴더 참고
- kubectl apply -f backend

**4. 콩 배포**

- kustomize build manifest | kubectl apply -f -
- 3번 폴더에서 manifest를 참고한다.
- **중요한 점은 공식 doc과 custom-plugin.yaml 가 다르다.**
- ingress-kong으로 하면 절대 안된다.

**5. 서비스 ingress 적용**

- kubectl apply -f plugin-apply-ingress-single-host.yml
- 4번 폴더의 plugin-apply-ingress-single-host.yml 을 적용한다.
