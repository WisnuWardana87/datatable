<?php
defined('BASEPATH') or exit('NO direct script accses allowed');
class Frontend extends CI_Controller
{
    function  __construct()
    {
        parent::__construct();
        $this->load->model('M_prestasi');
    }

    public function index()
    {
        $config['base_url'] = site_url('Prestasi/daftar_prestasi');
        $data['prestasi'] = $this->M_prestasi->data_prestasi();
        $this->load->view('templates/header_frontend');
        $this->load->view('templates/index_frontend', $data);
        $this->load->view('templates/footer_frontend');
    }
}
