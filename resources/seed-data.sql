SET NAMES utf8;

-- this creates the first and probably only op account; password is "operator" <- change it after your first login!
INSERT INTO `users` (`id`, `login`, `password`, `display_name`, `gravatar_hash`, `language`, `role`, `created_at`, `max_events`) VALUES
	(1, 'operator', '$2y$11$sItgjzvoNnRrnJw1zzKOde6n3.qwaBSAJDeu9Cg2EreFnxrf/AVVi', 'System Operator', NULL, 'en_us', 'ROLE_OP', '2014-10-11 04:20:00', 10);
