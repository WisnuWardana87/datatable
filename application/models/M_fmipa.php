<?php
class M_fmipa extends CI_Model
{
    function data_user()
    {
        $this->db->join('user_role', 'user_role.id=user.role_id');
        $this->db->join('tb_fakultas', 'tb_fakultas.id_fakultas=user.id_fakultas');
        $this->db->where('nama_fakultas', 'Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA) ');
        $data = $this->db->get('user')->result_array();
        return $data;
    }
    function data_jenis()
    {
        $this->db->join('tb_bidang', 'tb_bidang.id_bidang=tb_jenis_prestasi.id_bidang');
        $data = $this->db->get('tb_jenis_prestasi')->result_array();
        return $data;
    }
    function data_tingkat()
    {
        $data = $this->db->get('tb_tingkat')->result_array();
        return $data;
    }
    function data_jenis_juara()
    {
        $data = $this->db->get('tb_jenis_juara')->result_array();
        return $data;
    }

    function data_role()
    {
        $data = $this->db->get('user_role')->result_array();
        return $data;
    }

    function data_fakultas()
    {
        $data = $this->db->get('tb_fakultas')->result_array();
        return $data;
    }
    public function delete_user($key)
    {
        $this->db->where('id_user', $key);
        $this->db->delete('user');
    }
    function save_register_user($post)
    {
        $konfigurasi = array(
            'allowed_types' => 'jpg|jpeg|gif|png|bmp',
            'upload_path' => realpath('./assets/img/profile')
        );
        $this->load->library('upload', $konfigurasi);
        $this->upload->do_upload('image');
        $data = array(
            'name' => $post['name'],
            'email' => $post['email'],
            'image' => $_FILES['image']['name'],
            'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
            'id_fakultas' => $post['id_fakultas'],
            'role_id' => $post['role_id'],
            'is_active' => $post['is_active'],
            'date_created' => time()
        );
        $this->db->insert('user', $data);
    }

    public function save_update_register_user($post)
    {
        $konfigurasi = array(
            'allowed_types' => 'jpg|jpeg|gif|png|bmp',
            'upload_path' => realpath('./media/images')
        );
        $this->load->library('upload', $konfigurasi);
        $this->upload->do_upload('image');
        $data = array(
            'name' => $post['name'],
            'email' => $post['email'],
            'image' => $_FILES['image']['name'],
            'password' => $post['password'],
            'id_fakultas' => $post['id_fakultas'],
            'role_id' => $post['role_id'],
            'is_active' => $post['is_active'],
            'date_created' => time()
        );
        $this->db->where('md5(id_user)', $post['id_user']);
        $this->db->update('user', $data);
    }

    function data_prestasi()
    {
        $this->db->join('tb_jenis_prestasi', 'tb_jenis_prestasi.id_jenis=tb_prestasi.id_jenis');
        $this->db->join('tb_tingkat', 'tb_tingkat.id_tingkat=tb_prestasi.id_tingkat');
        $this->db->join('tb_jenis_juara', 'tb_jenis_juara.id_jenis_juara=tb_prestasi.id_jenis_juara');
        $this->db->join('tb_pembimbing', 'tb_pembimbing.id_pembimbing=tb_pembimbing.id_pembimbing');
        $this->db->join('user', 'user.name=tb_prestasi.name');
        $this->db->where('id_fakultas', '2');
        $data = $this->db->get('tb_prestasi')->result_array();
        return $data;
    }

    function detail($id_prestasi)
    {
        $this->db->join('tb_jenis_prestasi', 'tb_jenis_prestasi.id_jenis=tb_prestasi.id_jenis');
        $this->db->join('tb_tingkat', 'tb_tingkat.id_tingkat=tb_prestasi.id_tingkat');
        $this->db->join('tb_jenis_juara', 'tb_jenis_juara.id_jenis_juara=tb_prestasi.id_jenis_juara');
        $this->db->join('tb_pembimbing', 'tb_pembimbing.id_pembimbing=tb_prestasi.id_pembimbing');
        $this->db->join('user', 'user.name=tb_prestasi.name');
        $this->db->where('id_prestasi', $id_prestasi);
        $data = $this->db->get('tb_prestasi')->result_array();
        return $data;
    }

    function data_pembimbing()
    {
        $data = $this->db->get('tb_pembimbing')->result_array();
        return $data;
    }

    function data_mahasiswa()
    {
        $data = $this->db->get('tb_mahasiswa')->result_array();
        return $data;
    }

    public function delete_prestasi($key)
    {
        $this->db->where('id_prestasi', $key);
        $this->db->delete('tb_prestasi');
    }
    public function search_prestasi($keyword)
    {
        $this->db->join('tb_jenis_prestasi', 'tb_jenis_prestasi.id_jenis=tb_prestasi.id_jenis');
        $this->db->join('tb_tingkat', 'tb_tingkat.id_tingkat=tb_prestasi.id_tingkat');
        $this->db->join('tb_jenis_juara', 'tb_jenis_juara.id_jenis_juara=tb_prestasi.id_jenis_juara');
        $this->db->join('tb_pembimbing', 'tb_pembimbing.id_pembimbing=tb_pembimbing.id_pembimbing');
        $this->db->join('user', 'user.name=tb_prestasi.name');
        $this->db->where('id_fakultas', '2');
        $this->db->from('tb_prestasi');
        $this->db->like('tahun', $keyword);
        $this->db->or_like('kota', $keyword);
        return $this->db->get()->result_array();
    }
    function save_register_prestasi($post)
    {
        $konfigurasi = array(
            'allowed_types' => 'jpg|jpeg|gif|png|bmp',
            'upload_path' => realpath('./media/images')
        );
        $this->load->library('upload', $konfigurasi);
        $this->upload->do_upload('file_prestasi');
        $data = array(
            'id_jenis' => $post['id_jenis'],
            'id_tingkat' => $post['id_tingkat'],
            'id_jenis_juara' => $post['id_jenis_juara'],
            'tgl_mulai' => $post['tgl_mulai'],
            'tgl_selesai' => $post['tgl_selesai'],
            'nama_kegiatan' => $post['nama_kegiatan'],
            'kota' => $post['kota'],
            'jml_dana' => $post['jml_dana'],
            'name' => $post['name'],
            'ket_prestasi' => $post['ket_prestasi'],
            'file_prestasi' => $_FILES['file_prestasi']['name'],
            'id_pembimbing' => $post['id_pembimbing'],
            'tahun' => $post['tahun']
        );
        $this->db->insert('tb_prestasi', $data);
    }

    public function save_update_register_prestasi($post)
    {
        $konfigurasi = array(
            'allowed_types' => 'jpg|jpeg|gif|png|bmp',
            'upload_path' => realpath('./media/images')
        );
        $this->load->library('upload', $konfigurasi);
        $this->upload->do_upload('file_prestasi');
        $data = array(
            'id_jenis' => $post['id_jenis'],
            'id_tingkat' => $post['id_tingkat'],
            'id_jenis_juara' => $post['id_jenis_juara'],
            'tgl_mulai' => $post['tgl_mulai'],
            'tgl_selesai' => $post['tgl_selesai'],
            'nama_kegiatan' => $post['nama_kegiatan'],
            'kota' => $post['kota'],
            'jml_dana' => $post['jml_dana'],
            'name' => $post['name'],
            'ket_prestasi' => $post['ket_prestasi'],
            'file_prestasi' => $_FILES['file_prestasi']['name'],
            'id_pembimbing' => $post['id_pembimbing'],
            'tahun' => $post['tahun']

        );
        $this->db->where('md5(id_prestasi)', $post['id_prestasi']);
        $this->db->update('tb_prestasi', $data);
    }
    function export($export)
    {
        $this->db->join('tb_jenis_prestasi', 'tb_jenis_prestasi.id_jenis=tb_prestasi.id_jenis');
        $this->db->join('tb_tingkat', 'tb_tingkat.id_tingkat=tb_prestasi.id_tingkat');
        $this->db->join('tb_jenis_juara', 'tb_jenis_juara.id_jenis_juara=tb_prestasi.id_jenis_juara');
        $this->db->join('tb_pembimbing', 'tb_pembimbing.id_pembimbing=tb_pembimbing.id_pembimbing');
        $this->db->join('user', 'user.name=tb_prestasi.name');
        $this->db->where('id_fakultas', '2');
        $this->db->like('tahun', $export);
        $data = $this->db->get('tb_prestasi')->result_array();
        return $data;
    }
}
