
CREATE DATABASE DentisTR;



CREATE TABLE DentisTR.admin (
    F_NAME          VARCHAR(30)         NOT NULL,
    M_INIT          VARCHAR(1),
    L_NAME          VARCHAR(30)         NOT NULL,
    UR_ID_NUMBER    CHAR(8)            NOT NULL UNIQUE PRIMARY KEY,
    ACCESS_LEVEL    INTEGER             NOT NULL DEFAULT 1
)

CREATE TABLE DentisTR.seller (
    TR_ID           CHAR(11)            NOT NULL UNIQUE PRIMARY KEY,
    LAB_NAME        VARCHAR(30)         NOT NULL,
    PWORD           VARCHAR(30)         NOT NULL,
    UR_ID_NUMBER        CHAR(8)         NOT NULL,
    FOREIGN KEY (UR_ID_NUMBER) REFERENCES admin(UR_ID_NUMBER)
)

CREATE TABLE DentisTR.sellerDetail (
    TR_ID            CHAR(11)            NOT NULL UNIQUE PRIMARY KEY,
    PHONE_NUM        CHAR(10)            NOT NULL UNIQUE,
    EMAIL            VARCHAR(50)         NOT NULL UNIQUE
)

CREATE TABLE DentisTR.sellerAddress (
    TR_ID             CHAR(11)           NOT NULL UNIQUE PRIMARY KEY,
    COUNTRY           VARCHAR(50)        NOT NULL,
    CITY              VARCHAR(60)        NOT NULL DEFAULT 'TURKEY',
    STREET            VARCHAR(50)        NOT NULL,
    BLOCK_NUM         INTEGER            NOT NULL,
    ZIP_NUM           VARCHAR(10)        NOT NULL
)

CREATE TABLE DentisTR.buyer (
    F_NAME          VARCHAR(30)         NOT NULL,
    M_INIT          VARCHAR(1),
    L_NAME          VARCHAR(30)         NOT NULL,
    BUYER_ID        CHAR(8)             NOT NULL UNIQUE PRIMARY KEY,
    PHONE_NUM       CHAR(10)            NOT NULL,
    EMAIL           VARCHAR(30)         NOT NULL
)

CREATE TABLE DentisTR.buyerAddress (
    BUYER_ID        CHAR(8)             NOT NULL UNIQUE PRIMARY KEY,
    COUNTRY         VARCHAR(50)         NOT NULL,
    CITY            VARCHAR(50)         NOT NULL,
    STREET          VARCHAR(50)         NOT NULL,
    BLOCK_NUM       INTEGER             NOT NULL,
    ZIP_NUM         VARCHAR(10)         NOT NULL
)

CREATE TABLE DentisTR.product (
    PRODUCT_ID         CHAR(8)             NOT NULL UNIQUE PRIMARY KEY,
    PRODUCT_NAME       VARCHAR(30)         NOT NULL,
    PRICE              INTEGER             NOT NULL, 
    SELLER_ID          CHAR(11)            NOT NULL,
    FOREIGN KEY (SELLER_ID) REFERENCES seller(SELLER_ID)
)

CREATE TABLE DentisTR.orders (
    ORDER_ID         VARCHAR(1000)      NOT NULL UNIQUE PRIMARY KEY,
    PURCHASE_PRICE   INTEGER            NOT NULL,
    PURCHASE_DATE    VARCHAR(20)        NOT NULL,
    COMPLETION       BOOLEAN            DEFAULT 0,
    PRODUCT_ID       CHAR(8)            NOT NULL UNIQUE,   
    BUYER_ID         CHAR(8)            NOT NULL UNIQUE,
    FOREIGN KEY (PRODUCT_ID) REFERENCES product(PRODUCT_ID),
    FOREIGN KEY (BUYER_ID) REFERENCES buyer(BUYER_ID)
)

CREATE TABLE DentisTR.sellerReview (
    RATING            INTEGER           DEFAULT NULL,
    ORDER_ID          VARCHAR(1000)     NOT NULL UNIQUE PRIMARY KEY,
    COMMENTS          VARCHAR(200),
    FOREIGN KEY (ORDER_ID) REFERENCES orders(ORDER_ID)
);
