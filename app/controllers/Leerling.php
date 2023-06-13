<?php

class Leerling extends BaseController
{
    private $leerlingModel;
    public function __construct()
    {
        $this->leerlingModel = $this->model('LeerlingModel');
    }
    public function index()
    {
        /**
         * Haal alle instructeurs op uit de database (model)
         */
        $Leerlingen = $this->leerlingModel->getLeerlingen();


        // $aantalInstructeurs = sizeof($instructeurs);

        /**
         * Maak de rows voor de tbody in de view
         */
        $tableRows = '';

        foreach ($Leerlingen as $Leerling) {

            $tableRows .=  "<tr>
                                <td>$Leerling->naam</td>
                                <td>$Leerling->mobiel</td>
                                <td>$Leerling->pakketnaam</td>
                                <td>$Leerling->AantalLessen</td>
                                <td>$Leerling->Prijs</td>
                                <td>$Leerling->Startdatum</td>
                                <td>$Leerling->DatumRijbewijsbehaald</td>
                            </tr>";
        }
        /**
         * Het $data-array geeft alle belangrijke info door aan de view
         */
        $data = [
            'title' => 'Overzicht RijlesPakketten Leerlingen',
            'tableRows' => $tableRows
        ];

        $this->view('Leerling/index', $data);
    }
}
