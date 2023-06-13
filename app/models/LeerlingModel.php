<?php

class LeerlingModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getLeerlingen()
    {

        $sql = "SELECT
            LEE.Voornaam,
            LEE.mobiel,
            LSP.Pakketnaam,
            LSP.AantalLessen,
            LSP.Prijs,
            LPP.StartDatumRijlessen,
            LPP.DatumRijbewijsBehaald
        FROM Leerling AS LEE
        INNER JOIN LesPakket AS LSP 
        ON LSP.LespakketId = LEE.Id
        INNER JOIN LeerlingPerLesPakket AS LPP ON LPP.Id = LSP.LeerlingPerLesPakketId";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}
