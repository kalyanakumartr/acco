ALTER TABLE customer
     CHANGE modifieddate
            modifieddate TIMESTAMP NOT NULL
                           DEFAULT CURRENT_TIMESTAMP
                           ON UPDATE CURRENT_TIMESTAMP;