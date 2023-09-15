INSERT INTO es.`authorization` (url_pattern_value,authorization_name,http_method_code,sort_seq,created_date,modified_date,created_by,last_modified_by) VALUES
	 ('/user-service/api/v1/users','사용자 목록 조회','GET',1,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/users/?*','사용자 단건 조회','GET',2,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/users','사용자 등록','POST',3,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/users/?*','사용자 수정','PUT',4,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/users/token/refresh','사용자 토큰 갱신','GET',5,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/roles','권한 페이지 목록 조회','GET',6,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/roles/all','권한 전체 목록 조회','GET',7,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/authorizations','인가 페이지 목록 조회','GET',8,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/authorizations/?*','인가 단건 조회','GET',9,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/authorizations/sort-seq/next','인가 다음 정렬 순서 조회','GET',10,'2023-07-23 11:05:06.0','2021-09-06 10:22:19.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b');
INSERT INTO es.`authorization` (url_pattern_value,authorization_name,http_method_code,sort_seq,created_date,modified_date,created_by,last_modified_by) VALUES
	 ('/user-service/api/v1/authorizations','인가 등록','POST',11,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/authorizations/?*','인가 수정','PUT',12,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/authorizations/?*','인가 삭제','DELETE',13,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/authorizations/check','인가 여부 확인','GET',14,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/role-authorizations','권한 인가 페이지 목록 조회','GET',15,'2023-07-23 11:05:06.0','2021-07-23 11:05:06.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/user-service/api/v1/role-authorizations','권한 인가 다건 등록','POST',16,'2023-07-23 11:05:06.0','2021-08-02 09:06:53.0','65a00f65-8460-49af-98ec-042977e56f4b','65a00f65-8460-49af-98ec-042977e56f4b'),
	 ('/order','주문예제','GET',199,'2023-07-23 11:05:06.0',NULL,NULL,NULL);
