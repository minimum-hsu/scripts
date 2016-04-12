SET NAMES 'utf8';



DROP TABLE IF EXISTS event;

CREATE TABLE IF NOT EXISTS event_cases(
		id VARCHAR(50),
		endpoint VARCHAR(100) NOT NULL,
		metric VARCHAR(200) NOT NULL,
		func VARCHAR(50),
		cond VARCHAR(200) NOT NULL,
		note VARCHAR(200),
		max_step int(10) unsigned,
		current_step int(10) unsigned,
		priority INT(6) NOT NULL,
		status VARCHAR(20) NOT NULL,
		timestamp Timestamp NOT NULL,
		update_at Timestamp,
		closed_at Timestamp,
		closed_note VARCHAR(200),
		user_modified int(10) unsigned,
		tpl_creator VARCHAR(64),
		expression_id int(10) unsigned,
		strategy_id int(10) unsigned,
		template_id int(10) unsigned,
		PRIMARY KEY (id),
		INDEX (endpoint, strategy_id, template_id)
)
	ENGINE =InnoDB
	DEFAULT CHARSET =utf8;

CREATE TABLE IF NOT EXISTS events (
		id MEDIUMINT NOT NULL AUTO_INCREMENT,
		event_caseId VARCHAR(50),
		step int(10) unsigned,
		cond VARCHAR(200) NOT NULL,
		timestamp Timestamp,
		PRIMARY KEY (id),
		INDEX(event_caseId),
		FOREIGN KEY (event_caseId) REFERENCES event_cases(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
)
	ENGINE =InnoDB
	DEFAULT CHARSET =utf8;


