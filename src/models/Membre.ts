

export default class Membre{
    
    Groupe_idGroupe: number;
    User_IdUser: number;
    

    constructor(Groupe_idGroupe: number, User_IdUser: number, dateAppartenance: string, dateExclusion: string){
        this.Groupe_idGroupe = Groupe_idGroupe;
        this.User_IdUser = User_IdUser;
    }
    get attribut(): Array < string> {
        return['Groupe_idGroupe','User_IdUser','dateAppartenance', 'dateExclusion'];
    }
}