CREATE  TABLE PLAYERS(
    PlayerID        	Int(4)          NOT NULL,
    FirstName           Char(30)        NOT NULL,  
    LastName            Char(30)        NOT NULL,
    Position            Char(25)        NOT NULL,
    GPA                 Numeric(3,2)    NOT NULL,
    GradYear            Int(4)          NOT NULL,
    StudyHours          Int(2)          NOT NULL,
    CommServiceHours    Int(3)          NOT NULL,
    CONSTRAINT          PLAYERS_PK      PRIMARY KEY(JerseyNumber)
    );

CREATE  TABLE COACHES(
    CoachID             Int(3) 			NOT NULL,
    FirstName           Char(30)    	NOT NULL,
    LastName            Char(30)   		NOT NULL,
    PlayerID			Int(4)			NOT NULL,
    Position            Char(25)   		NOT NULL,     
    Title               Char(30) 		NOT NULL,
    Travel              Char(3) 		NOT NULL,
    CONSTRAINT          COACHES_PK  	PRIMARY KEY(CoachID)
    CONSTRAINT          COACH_PLAYERS_FK    FOREIGN KEY(PlayerID)
                            REFERENCES PLAYERS(PlayerID)
                                ON UPDATE CASCADE
    );

CREATE  TABLE HIGHSCHOOL(
    HighSchoolID        Int(3) 			NOT NULL,
    HighSchoolName      Char(50)     	NOT NULL,
	PlayerID			Int(4)			NOT NULL,
    StreetAddress       Char(100)   	NOT NULL,
    City                Char(30)        NOT NULL,
    State               Char(2) 		NOT NULL,
    ZIP                 Int(5) 			NOT NULL,
    Distance            Int(5) 			NOT NULL,
    CONSTRAINT          HIGHSCHOOL_PK  	PRIMARY KEY(HighSchoolID)
	CONSTRAINT          HIGH_PLAYERS_FK    FOREIGN KEY(PlayerID)
                            REFERENCES PLAYERS(PlayerID)
                                ON UPDATE CASCADE
    );

CREATE  TABLE MEDICALSTAFF(
    StaffID             Int(3) 			NOT NULL,
    FirstName			Char(30)		NOT NULL,
    LastName            Char(30)    	NOT NULL,
	PlayerID			Int(4)			NOT NULL,
    Title               Char(50) 		NOT NULL,
    Travel              Char(1) 		NOT NULL,
    CONSTRAINT          MEDICALSTAFF_PK		PRIMARY KEY(StaffID)
	CONSTRAINT          MEDIC_PLAYERS_FK    FOREIGN KEY(PlayerID)
                            REFERENCES PLAYERS(PlayerID)
                                ON UPDATE CASCADE
    );

CREATE  TABLE RECRUITS(
    RecruitID           Int(3) 			NOT NULL,
    HighSchoolID        Int(3) 			NOT NULL,
    FirstName           Char(30)		NOT NULL,
    LastName            Char(30)   		NOT NULL,
    Position            Char(25) 		NOT NULL,
    GradYear            Int(4) 			NOT NULL,
    CONSTRAINT          RECRUITS_PK         PRIMARY KEY(RecruitID),
    CONSTRAINT          RECRUITS_HIGH_FK    FOREIGN KEY(HighSchoolID)
                            REFERENCES HIGHSCHOOL(HighSchoolID)
                                ON UPDATE CASCADE
    );

CREATE  TABLE PLAYEREQ(
    PlayerEQID          Int(3) 			NOT NULL,
    PlayerID        	Int(4)     		NOT NULL,
    Description         Char(100)   	NOT NULL,
    Travel              Char(1)    		NOT NULL,
    ExpectedLife        Int(2) 			NOT NULL,
    CONSTRAINT          PLAYEREQ_PK            	PRIMARY KEY(PlayerEQID),
    CONSTRAINT          PLAYEREQ_PLAYERS_FK     FOREIGN KEY(JerseyNumber)
                            REFERENCES PLAYERS(JerseyNumber)
                                ON UPDATE CASCADE
    );  

CREATE  TABLE MEDRECORDS(
	RecordID			Int(3)			NOT NULL,
    StaffID             Int(3) 			NOT NULL,
    PlayerID        	Int(4)     		NOT NULL,
    InjuryStatus        Char(50)   		NULL,
    Allergies           Char(50) 		NULL,
    CONSTRAINT          MEDRECORDS_PK     PRIMARY KEY(RecordID),
    CONSTRAINT          MEDREC_PLAYERS_FK        FOREIGN KEY(JerseyNumber)
                            REFERENCES PLAYERS(JerseyNumber)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE,
    CONSTRAINT          MEDREC_MEDIC_FK        FOREIGN KEY(StaffID)
                            REFERENCES MEDICALSTAFF(StaffID)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE
    );

CREATE  TABLE TRAINEREQ(
    TrainerEQID         Int(3) 			NOT NULL,
    StaffID        		Int(3) 			NULL,
    Description         Char(100)   	NOT NULL,
    Travel              Char(1)        	NOT NULL,
    ExpectedLife        Int(2) 			NOT NULL,
    CONSTRAINT          TRAINEREQ_PK    PRIMARY KEY(TrainerEQID),
    CONSTRAINT 		TRAINEREQ_MEDIC_FK 	FOREIGN KEY(StaffID)
    				REFERENCES MEDICALSTAFF(StaffID)
					ON UPDATE CASCADE
    );
