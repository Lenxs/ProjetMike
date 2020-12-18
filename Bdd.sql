#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

#------------------------------------------------------------
# Table: User
#------------------------------------------------------------

CREATE TABLE User(
        idUser          Int  Auto_increment  NOT NULL ,
        nom             Varchar (50) NOT NULL ,
        prenom          Varchar (50) NOT NULL ,
        mail            Varchar (50) NOT NULL ,
        statut          Varchar (50) NOT NULL ,
        password        Varchar (50) NOT NULL ,
        dateInscription DATETIME NOT NULL
	,CONSTRAINT User_PK PRIMARY KEY (idUser)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Groupe
#------------------------------------------------------------

CREATE TABLE Groupe(
        idGroupe     Int  Auto_increment  NOT NULL ,
        nomGroupe    Varchar (50) NOT NULL ,
        dateCreation DATETIME NOT NULL ,
        idUser       Int NOT NULL
	,CONSTRAINT Groupe_PK PRIMARY KEY (idGroupe)

	,CONSTRAINT Groupe_User_FK FOREIGN KEY (idUser) REFERENCES User(idUser)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Asset
#------------------------------------------------------------

CREATE TABLE Asset(
        idAsset  Int  Auto_increment  NOT NULL ,
        url      Varchar (50) NOT NULL ,
        idGroupe Int NOT NULL
	,CONSTRAINT Asset_PK PRIMARY KEY (idAsset)

	,CONSTRAINT Asset_Groupe_FK FOREIGN KEY (idGroupe) REFERENCES Groupe(idGroupe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Image
#------------------------------------------------------------

CREATE TABLE Image(
        idAsset    Int NOT NULL ,
        resolution Varchar (50) NOT NULL ,
        format     Varchar (50) NOT NULL ,
        url        Varchar (50) NOT NULL ,
        idGroupe   Int NOT NULL
	,CONSTRAINT Image_PK PRIMARY KEY (idAsset)

	,CONSTRAINT Image_Asset_FK FOREIGN KEY (idAsset) REFERENCES Asset(idAsset)
	,CONSTRAINT Image_Groupe0_FK FOREIGN KEY (idGroupe) REFERENCES Groupe(idGroupe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Video
#------------------------------------------------------------

CREATE TABLE Video(
        idAsset  Int NOT NULL ,
        Qualite  Varchar (50) NOT NULL ,
        Duree    Float NOT NULL ,
        url      Varchar (50) NOT NULL ,
        idGroupe Int NOT NULL
	,CONSTRAINT Video_PK PRIMARY KEY (idAsset)

	,CONSTRAINT Video_Asset_FK FOREIGN KEY (idAsset) REFERENCES Asset(idAsset)
	,CONSTRAINT Video_Groupe0_FK FOREIGN KEY (idGroupe) REFERENCES Groupe(idGroupe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Conversation
#------------------------------------------------------------

CREATE TABLE Conversation(
        idConv         Int  Auto_increment  NOT NULL ,
        nomConv        Varchar (50) NOT NULL ,
        idUser         Int NOT NULL ,
        idUser_ajouter Int NOT NULL
	,CONSTRAINT Conversation_PK PRIMARY KEY (idConv)

	,CONSTRAINT Conversation_User_FK FOREIGN KEY (idUser) REFERENCES User(idUser)
	,CONSTRAINT Conversation_User0_FK FOREIGN KEY (idUser_ajouter) REFERENCES User(idUser)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Message
#------------------------------------------------------------

CREATE TABLE Message(
        idMessage  Int  Auto_increment  NOT NULL ,
        contenu    Varchar (50) NOT NULL ,
        dateEnvoi  DATETIME NOT NULL ,
        idConv     Int NOT NULL ,
        idUser     Int NOT NULL
        ,CONSTRAINT Message_PK PRIMARY KEY (idMessage)

        ,CONSTRAINT Message_Conversation_FK FOREIGN KEY (idConv) REFERENCES Conversation(idConv)
        ,CONSTRAINT Message_User0_FK FOREIGN KEY (idUser) REFERENCES User(idUser)
)ENGINE=InnoDB;



#------------------------------------------------------------
# Table: Membre
#------------------------------------------------------------

CREATE TABLE Membre(
        idGroupe Int NOT NULL ,
        idUser   Int NOT NULL
	,CONSTRAINT Membre_PK PRIMARY KEY (idGroupe,idUser)

	,CONSTRAINT Membre_Groupe_FK FOREIGN KEY (idGroupe) REFERENCES Groupe(idGroupe)
	,CONSTRAINT Membre_User0_FK FOREIGN KEY (idUser) REFERENCES User(idUser)
)ENGINE=InnoDB;
