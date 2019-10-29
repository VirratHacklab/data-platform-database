ALTER TABLE device ADD hierarchy_id INTEGER NOT NULL;
ALTER TABLE device ADD CONSTRAINT hierarchy_fk FOREIGN KEY (hierarchy_id) REFERENCES hierarchy (id) ON DELETE RESTRICT;