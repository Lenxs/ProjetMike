#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: User
#------------------------------------------------------------

CREATE TABLE User(
        idUser Int  Auto_increment  NOT NULL ,
        email  Varchar (50) NOT NULL ,
        pass   Varchar (50) NOT NULL ,
        statut Bool NOT NULL ,
        nom    Varchar (50) NOT NULL ,
        prenom Varchar (50) NOT NULL
	,CONSTRAINT User_PK PRIMARY KEY (idUser)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Groupe
#------------------------------------------------------------

CREATE TABLE Groupe(
        IdGroupe       Int  Auto_increment  NOT NULL ,
        nomGroupe      Varchar (50) NOT NULL ,
        nombrePersonne Int NOT NULL ,
        dateCreation   Date NOT NULL ,
        idUser         Int NOT NULL
	,CONSTRAINT Groupe_PK PRIMARY KEY (IdGroupe)

	,CONSTRAINT Groupe_User_FK FOREIGN KEY (idUser) REFERENCES User(idUser)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: asset
#------------------------------------------------------------

CREATE TABLE asset(
        idAsset  Int  Auto_increment  NOT NULL ,
        IdGroupe Int NOT NULL
	,CONSTRAINT asset_PK PRIMARY KEY (idAsset)

	,CONSTRAINT asset_Groupe_FK FOREIGN KEY (IdGroupe) REFERENCES Groupe(IdGroupe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: image
#------------------------------------------------------------

CREATE TABLE image(
        idAsset  Int NOT NULL ,
        nom      Varchar (50) NOT NULL ,
        lien     Varchar (50) NOT NULL ,
        IdGroupe Int NOT NULL
	,CONSTRAINT image_PK PRIMARY KEY (idAsset)

	,CONSTRAINT image_asset_FK FOREIGN KEY (idAsset) REFERENCES asset(idAsset)
	,CONSTRAINT image_Groupe0_FK FOREIGN KEY (IdGroupe) REFERENCES Groupe(IdGroupe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: video
#------------------------------------------------------------

CREATE TABLE video(
        idAsset  Int NOT NULL ,
        nomVideo Varchar (50) NOT NULL ,
        lien     Varchar (50) NOT NULL ,
        IdGroupe Int NOT NULL
	,CONSTRAINT video_PK PRIMARY KEY (idAsset)

	,CONSTRAINT video_asset_FK FOREIGN KEY (idAsset) REFERENCES asset(idAsset)
	,CONSTRAINT video_Groupe0_FK FOREIGN KEY (IdGroupe) REFERENCES Groupe(IdGroupe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: appartient
#------------------------------------------------------------

CREATE TABLE appartient(
        IdGroupe         Int NOT NULL ,
        idUser           Int NOT NULL ,
        dateAppartenance Date NOT NULL ,
        dateExclusion    Date NOT NULL
	,CONSTRAINT appartient_PK PRIMARY KEY (IdGroupe,idUser)

	,CONSTRAINT appartient_Groupe_FK FOREIGN KEY (IdGroupe) REFERENCES Groupe(IdGroupe)
	,CONSTRAINT appartient_User0_FK FOREIGN KEY (idUser) REFERENCES User(idUser)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: message
#------------------------------------------------------------

CREATE TABLE message(
        idUser         Int NOT NULL ,
        idUser_envoyer Int NOT NULL ,
        dateEnvoi      Date NOT NULL ,
        dateReception  Date NOT NULL ,
        destinataire   Varchar (50) NOT NULL ,
        expediteur     Varchar (50) NOT NULL ,
        contenu        Varchar (50) NOT NULL
	,CONSTRAINT message_PK PRIMARY KEY (idUser,idUser_envoyer)

	,CONSTRAINT message_User_FK FOREIGN KEY (idUser) REFERENCES User(idUser)
	,CONSTRAINT message_User0_FK FOREIGN KEY (idUser_envoyer) REFERENCES User(idUser)
)ENGINE=InnoDB;

