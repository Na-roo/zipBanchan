/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		m_name                        		VARCHAR2(30)		 NOT NULL,
		m_id                          		VARCHAR2(20)		 NULL ,
		m_password                    		VARCHAR2(20)		 NOT NULL,
		m_address                     		VARCHAR2(100)		 NULL ,
		m_phone                       		VARCHAR2(30)		 NOT NULL,
		m_email                       		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.m_name is '회원이름';
COMMENT ON COLUMN member.m_id is '회원아이디';
COMMENT ON COLUMN member.m_password is '회원비밀번호';
COMMENT ON COLUMN member.m_address is '회원주소';
COMMENT ON COLUMN member.m_phone is '회원전화번호';
COMMENT ON COLUMN member.m_email is '회원이메일';


/**********************************/
/* Table Name: productCategory */
/**********************************/
CREATE TABLE productCategory(
		categoryNo                    		NUMBER(20)		 NULL ,
		categoryName                  		VARCHAR2(255)		 NOT NULL
);

COMMENT ON TABLE productCategory is 'productCategory';
COMMENT ON COLUMN productCategory.categoryNo is 'categoryNo';
COMMENT ON COLUMN productCategory.categoryName is 'categoryName';


/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(100)		 NOT NULL,
		p_price                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		p_limitQty                    		NUMBER(10)		 NULL ,
		categoryNo                    		NUMBER(20)		 NULL ,
		productImage                  		VARCHAR2(255)		 NOT NULL
);

COMMENT ON TABLE product is '상품';
COMMENT ON COLUMN product.p_no is '상품번호';
COMMENT ON COLUMN product.p_name is '상품이름';
COMMENT ON COLUMN product.p_price is '상품가격';
COMMENT ON COLUMN product.p_limitQty is '상품수량';
COMMENT ON COLUMN product.categoryNo is 'categoryNo';
COMMENT ON COLUMN product.productImage is '상품이미지';


/**********************************/
/* Table Name: 주문 */
/**********************************/
CREATE TABLE jumun(
		j_no                          		NUMBER(10)		 NULL ,
		j_date                        		DATE		 DEFAULT sysdate		 NULL ,
		j_qty                         		NUMBER(10)		 DEFAULT 0		 NULL ,
		j_price                       		NUMBER(10)		 DEFAULT 0		 NULL ,
		j_receiver_name               		VARCHAR2(20)		 NOT NULL,
		j_receiver_address            		VARCHAR2(255)		 NOT NULL,
		m_id                          		VARCHAR2(20)		 NULL 
);

COMMENT ON TABLE jumun is '주문';
COMMENT ON COLUMN jumun.j_no is '주문번호';
COMMENT ON COLUMN jumun.j_date is '주문날짜';
COMMENT ON COLUMN jumun.j_qty is '주문수량';
COMMENT ON COLUMN jumun.j_price is '주문총가격';
COMMENT ON COLUMN jumun.j_receiver_name is '배송받는사람';
COMMENT ON COLUMN jumun.j_receiver_address is '배송지';
COMMENT ON COLUMN jumun.m_id is '회원아이디';


/**********************************/
/* Table Name: 장바구니 */
/**********************************/
CREATE TABLE cart(
		cart_p_no                     		NUMBER(10)		 NULL ,
		cart_p_qty                    		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL ,
		m_id                          		VARCHAR2(20)		 NULL 
);

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cart_p_no is '장바구니상품번호';
COMMENT ON COLUMN cart.cart_p_qty is '장바구니상품수량';
COMMENT ON COLUMN cart.p_no is '상품번호';
COMMENT ON COLUMN cart.m_id is '회원아이디';


/**********************************/
/* Table Name: 고객후기 게시판 */
/**********************************/
CREATE TABLE board(
		b_no                          		NUMBER(20)		 NOT NULL,
		writeDate                     		DATE		 NOT NULL,
		evalPoint                     		NUMBER(10)		 NOT NULL,
		b_content                     		VARCHAR2(255)		 NOT NULL,
		m_id                          		VARCHAR2(20)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

COMMENT ON TABLE board is '고객후기 게시판';
COMMENT ON COLUMN board.b_no is '게시판 번호';
COMMENT ON COLUMN board.writeDate is '작성일';
COMMENT ON COLUMN board.evalPoint is '평점';
COMMENT ON COLUMN board.b_content is '후기내용';
COMMENT ON COLUMN board.m_id is '회원아이디';
COMMENT ON COLUMN board.p_no is '상품번호';


/**********************************/
/* Table Name: jumunDetail */
/**********************************/
CREATE TABLE jumunDetail(
		j_no                          		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL ,
		jd_qty                        		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE jumunDetail is 'jumunDetail';
COMMENT ON COLUMN jumunDetail.j_no is '주문번호';
COMMENT ON COLUMN jumunDetail.p_no is '상품번호';
COMMENT ON COLUMN jumunDetail.jd_qty is '주문제품수량';



ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (m_id);

ALTER TABLE productCategory ADD CONSTRAINT IDX_productCategory_PK PRIMARY KEY (categoryNo);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (categoryNo) REFERENCES productCategory (categoryNo);

ALTER TABLE jumun ADD CONSTRAINT IDX_jumun_PK PRIMARY KEY (j_no);
ALTER TABLE jumun ADD CONSTRAINT IDX_jumun_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_p_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE board ADD CONSTRAINT IDX_board_PK PRIMARY KEY (b_no);
ALTER TABLE board ADD CONSTRAINT IDX_board_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);
ALTER TABLE board ADD CONSTRAINT IDX_board_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE jumunDetail ADD CONSTRAINT IDX_jumunDetail_PK PRIMARY KEY (j_no, p_no);
ALTER TABLE jumunDetail ADD CONSTRAINT IDX_jumunDetail_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE jumunDetail ADD CONSTRAINT IDX_jumunDetail_FK1 FOREIGN KEY (j_no) REFERENCES jumun (j_no);

