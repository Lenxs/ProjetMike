
export default class Asset{

    idAsset: number;
    Groupe_IdGroupe : number;

    constructor(idAsset: number, Groupe_IdGroupe: number){
        this.idAsset = idAsset;
        this.Groupe_IdGroupe = Groupe_IdGroupe;
    }
    get attribut(): Array < string> {
        return['idAsset','Groupe_IdGroupe'];
    }
}