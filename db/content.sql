use weblinks;

/* raw password is 'john' */
insert into t_user(usr_name, usr_salt, usr_password, usr_role) values
('JohnDoe', 'YcM=A$nsYzkyeDVjEUa7W9K', 'L2nNR5hIcinaJkKR+j4baYaZjcHS0c3WX2gjYF6Tmgl1Bs+C9Qbr+69X8eQwXDvw0vp73PrcSeT0bGEW5+T2hA==', 'ROLE_USER');
/* raw password is 'jane' */
insert into t_user(usr_name, usr_salt, usr_password, usr_role) values
('JaneDoe', 'dhMTBkzwDKxnD;4KNs,4ENy', 'EfakNLxyhHy2hVJlxDmVNl1pmgjUZl99gtQ+V3mxSeD8IjeZJ8abnFIpw9QNahwAlEaXBiQUBLXKWRzOmSr8HQ==', 'ROLE_USER');
/* raw password is '@dm1n' */
insert into t_user(usr_name, usr_salt, usr_password, usr_role) values
('admin', 'EDDsl&fBCJB|a5XUtAlnQN8', 'gqeuP4YJ8hU3ZqGwGikB6+rcZBqefVy+7hTLQkOD+jwVkp4fkS7/gr1rAQfn9VUKWc7bvOD7OsXrQQN5KGHbfg==', 'ROLE_ADMIN');

insert into t_link(usr_id, lin_title, lin_url) values
(1, 'Les « dev » ces nouvelles stars que l''on s''arrache', 'http://www.lesechos.fr/journal20141121/lec1_enquete/0203908469986-les-dev-ces-nouvelles-stars-que-lon-sarrache-1066627.php');
insert into t_link(usr_id, lin_title, lin_url) values
(1, 'The state of JavaScript in 2015', 'http://www.breck-mckye.com/blog/2014/12/the-state-of-javascript-in-2015/');
insert into t_link(usr_id, lin_title, lin_url) values
(2, 'Guide d''autodéfense numérique', 'http://guide.boum.org/');
insert into t_link(usr_id, lin_title, lin_url) values
(2, 'Controverse du GamerGate', 'http://fr.wikipedia.org/wiki/Controverse_du_Gamergate');
