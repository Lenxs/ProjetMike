#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

drop database if exists messenger;
CREATE database messenger;
use messenger;
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


insert into User values(null,'jax','simus','t@t.fr','actif','zbibidadabi',NOW()),(null,'master','yi','ri@ot.ga','actif','afefeabi',NOW());
insert into User values(null,'dra','ven','l@o.r','actif','pollpo',NOW()),(null,'dema','cia','ga@m.e','actif','terrspin',NOW());
insert into Conversation values(null,'test',1,2);
insert into Message values(null,'testDate+heure',NOW(),1,2),(null,'yfkdjbldih',NOW(),1,1),(null,'?',NOW(),1,2);
insert into Groupe values(null,'g1',NOW(),1),(null,'g2',NOW(),2),(null,'g3',NOW(),1),(null,'g5',NOW(),4);
insert into Groupe values(null,'g4',NOW(),1),(null,'g6',NOW(),4),(null,'g7',NOW(),1),(null,'g8',NOW(),3);
insert into Membre values(1,1),(2,1),(4,1),(1,2),(3,2),(4,2),(8,2),(1,3),(8,3),(5,3),(4,4),(7,3),(7,4),(8,1);




#---- Requete -----#


#selection des message et de leurs conversation avec l'id de user qui envoi
select m.contenu,m.dateEnvoi as heure_envoi ,c.nomConv as nom_Conversation,m.idUser
from Message m,Conversation c, User u
where m.idConv = c.idConv and c.idUser = u.idUser;




select m.contenu,m.dateEnvoi,m.heureEnvoi ,c.nomConv as nom_Conversation,m.idUser,c.idUser_ajouter
from Message m,Conversation c, User u
where m.idConv = c.idConv and c.idUser = u.idUser;


#liste des membres de groupe classe par nom de groupe
select g.nomGroupe,u.nom,u.prenom
from User u, Groupe g,Membre m
where m.idUser=u.idUser and m.idGroupe=g.idGroupe ORDER BY nomGroupe;


#-- nb personne dans groupe --#
select count(*)as nb_personne_groupe from listAllGroup where nomGroupe = 'g1';


#nom prenom des personne dans groupe --#
select nom,prenom from listAllGroup where nomGroupe='g1';


#--- View ---#


CREATE view listAllGroup as (select g.nomGroupe,u.nom,u.prenom
from User u, Groupe g,Membre m
where m.idUser=u.idUser and m.idGroupe=g.idGroupe ORDER BY nomGroupe
);
