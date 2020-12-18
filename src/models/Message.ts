

export default class Message {

    protected idMessage: number;
    protected idUser: number;
    protected idUser_envoyer: number;
    public dateEnvoi: Date;
    public dateReception: Date;
    protected destinataire: string; 
    protected expediteur: string;
    public contenu: string | null;
    
    constructor(idMessage: number, idUser: number, idUser_envoyer: number, dateEnvoi: Date, dateReception: Date, destinataire: string, expediteur: string, contenu: string) {
        this.idMessage = idMessage;
        this.idUser = idUser;
        this.idUser_envoyer = idUser_envoyer;
        this.dateEnvoi = dateEnvoi;
        this.dateReception = dateReception;
        this.destinataire = destinataire;
        this.expediteur = expediteur;
        this.contenu = contenu;
    }

    get attribut(): Array < string> {
        return['idUser','idUser_envoyer','dateEnvoi', 'dateReception', 'destinataire', 'expediteur', 'contenu'];
    }
} 