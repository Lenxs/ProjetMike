export type listeTables = "message" | "user" | "video" | "image" | "groupe" | "asset" | "membre" ;


interface attributSelectInterface {
    primaryKey: string;
    attribut: Array < string > ;
}

const listAttributSelect: Record < listeTables, attributSelectInterface > = { //Constructs a type with a set of properties Keys of type Type. This utility can be used to map the properties of a type to another type.
    "message": {
        primaryKey: `idMessage`,
        attribut: [`idMessage`, `idUser`, `idUser_envoyer`, `dateEnvoi`, `dateReception`, `destinataire`, `expediteur`, `contenu`]
    },
    "user": {
        primaryKey: `id`,
        attribut: [`email`, `pass`, `nom`, `prenom`, `statut`]
    },
    "video": {
        primaryKey: `idAsset`,
        attribut: [`lien`, `nomVideo`, `idGroupe`]
    },
    "image": {
        primaryKey: `idAsset`,
        attribut: [`idPays`, `nom`]
    },
    "groupe": {
        primaryKey: `idGroupe`,
        attribut: [`idGroupe`, `nomGroupe`,`nombrePersonne`, `dateCreation`, `User_idUser`]
    },
    "asset": {
        primaryKey: `idAsset`,
        attribut: [`idAsset`, `Groupe_IdGroupe`]
    },
    "membre": {
        primaryKey: `idPays`,
        attribut: [`idPays`, `nom`]
    },
};

// export default listeTables; 
export default listAttributSelect;