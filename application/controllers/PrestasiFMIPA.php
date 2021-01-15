<?php
defined('BASEPATH') or exit('No direct script access allowed');

class PrestasiFMIPA extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_fmipa');

        is_logged_in();
    }

    public function index()
    {
        $data['title'] = 'Dashboard';
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('admin/index', $data);
        $this->load->view('templates/footer');
    }


    function daftar_user()
    {
        $data['title'] = "Data User FMIPA";
        $config['base_url'] = site_url('PrestasiFMIPA/daftar_user');
        $data['users'] = $this->M_fmipa->data_user();
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('fmipa/user', $data);
        $this->load->view('templates/footer');
    }
    function register_user()
    {
        $data['title'] = "Register Data User";
        $data['nama_fakultas'] = $this->M_fmipa->data_fakultas();
        $data['role'] = $this->M_fmipa->data_role();
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('fmipa/register_user', $data);
        $this->load->view('templates/footer');
    }

    public function update_register_user($id_user)
    {
        $data['title'] = "Registrasi";
        $this->db->where('md5(id_user)', $id_user);
        $data['id_user'] = $this->db->get('user')->row_array();
        $data['nama_fakultas'] = $this->M_fmipa->data_fakultas();
        $data['role'] = $this->M_fmipa->data_role();
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('fmipa/register_user', $data);
        $this->load->view('templates/footer');
    }

    public function delete_user()
    {

        $key = $this->uri->segment(3);
        $this->db->where('id_user', $key);
        $query = $this->db->get('user');
        if ($query->num_rows() > 0) {
            $this->M_fmipa->delete_user($key);
        }
        $this->session->set_flashdata(
            'message',
            '<div class="alert alert-danger" role="alert">
        <div class="text-center">Data berhasil dihapus !</div>
      </div>'
        );
        redirect('PrestasiFMIPA/daftar_user');
    }
    public function save_register_user()
    {
        if ($_POST['id_user'] != '') {
            $this->M_fmipa->save_update_register_user($_POST);
        } else {
            $this->M_fmipa->save_register_user($_POST);
        }
        redirect('PrestasiFMIPA/daftar_user');
    }

    function daftar_prestasi()
    {
        $data['title'] = "Data Prestasi Mahasiswa";
        $config['base_url'] = site_url('PrestasiFMIPA/daftar_prestasi');
        $data['prestasi'] = $this->M_fmipa->data_prestasi();
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('fmipa/prestasi', $data);
        $this->load->view('templates/footer');
    }
    function detail($id_prestasi)
    {
        $data['title'] = "Detail Data Prestasi";
        $data['detail_prestasi'] = $this->M_fmipa->detail($id_prestasi);
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('fmipa/detail_prestasi', $data);
        $this->load->view('templates/footer');
    }
    public function search_prestasi()
    {

        $keyword = $this->input->post('keyword');
        $data['prestasi'] = $this->M_fmipa->search_prestasi($keyword);
        $data['title'] = "Data Prestasi Mahasiswa";
        $data['tahun'] = $this->M_fmipa->data_prestasi();
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('fmipa/prestasi', $data);
        $this->load->view('templates/footer');
    }
    function register_prestasi()
    {
        $data['title'] = "Register Data Prestasi";
        $data['nama_jenis'] = $this->M_fmipa->data_jenis();
        $data['nama_tingkat'] = $this->M_fmipa->data_tingkat();
        $data['nama_jenis_juara'] = $this->M_fmipa->data_jenis_juara();
        $data['name'] = $this->M_fmipa->data_user();
        $data['nama_pembimbing'] = $this->M_fmipa->data_pembimbing();
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('fmipa/register_prestasi', $data);
        $this->load->view('templates/footer');
    }

    public function update_register_prestasi($id_prestasi)
    {
        $data['title'] = "Registrasi";
        $this->db->where('md5(id_prestasi)', $id_prestasi);
        $data['id_prestasi'] = $this->db->get('tb_prestasi')->row_array();
        $data['nama_jenis'] = $this->M_fmipa->data_jenis();
        $data['nama_tingkat'] = $this->M_fmipa->data_tingkat();
        $data['nama_jenis_juara'] = $this->M_fmipa->data_jenis_juara();
        $data['name'] = $this->M_fmipa->data_user();
        $data['nama_pembimbing'] = $this->M_fmipa->data_pembimbing();
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('fmipa/register_prestasi', $data);
        $this->load->view('templates/footer');
    }

    public function delete_prestasi()
    {

        $key = $this->uri->segment(3);
        $this->db->where('id_prestasi', $key);
        $query = $this->db->get('tb_prestasi');
        if ($query->num_rows() > 0) {
            $this->M_fmipa->delete_prestasi($key);
        }
        redirect('PrestasiFMIPA/daftar_prestasi');
    }
    public function save_register_prestasi()
    {
        if ($_POST['id_prestasi'] != '') {
            $this->M_fmipa->save_update_register_prestasi($_POST);
        } else {
            $this->M_fmipa->save_register_prestasi($_POST);
        }
        redirect('PrestasiFMIPA/daftar_prestasi');
    }

    public function export()
    {
        $data['title'] = "Laporan Data Prestasi Mahasiswa";
        $export = $this->input->post('export');
        $data['exportdata']  = $this->M_fmipa->export($export);
        $this->load->view('fmipa/export', $data);
    }
}
