GRANT ALL PRIVILEGES ON *.* TO 'dev'@'%';
GRANT SUPER ON *.* TO 'dev'@'%';

CREATE TABLE if not exists logging.audit (
    id bigint(20) NOT NULL AUTO_INCREMENT,
    userId varchar(50) DEFAULT NULL,
    action varchar(128) DEFAULT NULL,
    msg text,
    category varchar(128) DEFAULT NULL,
    browser json DEFAULT NULL,
    insertDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
    );
    
insert into logging.audit(id, userId, action, msg, browser) values
    (1, 'user-1', 'LOGIN', 'User logged in', '{"name": "Chrome", "major": "67", "version": "67.0.3396.99"}'),
    (2, 'user-1', 'NAVIGATION', 'Navigated to /search', '{"name": "Chrome", "major": "67", "version": "67.0.3396.99"}'),
    (3, 'user-1', 'SEARCH', '', '{"name": "Chrome", "major": "67", "version": "67.0.3396.99"}'),
    (4, 'user-1', 'LOGOUT', 'User logged out', '{"name": "Chrome", "major": "67", "version": "67.0.3396.99"}');
    
CREATE TABLE IF NOT EXISTS logging.user (
	id bigint, 
	firstname varchar(10), 
	lastname varchar(10), 
	age integer
);

insert into logging.user(id, firstname, lastname, age) values
(1, 'hasan', 'khadra', 20),
(2, 'kamil', 'sabbagh', 21),
(3, 'mohammad', 'shahin', 21);

