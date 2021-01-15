<!--== Header Area End ==-->

<!--== Slider Area Start ==-->
<section id="slider-area">
    <!--== slide Item One ==-->
    <img src="<?= base_url(); ?>assets2/img/image.JPG">
    <!--== slide Item One ==-->
</section>
<!--== Slider Area End ==-->

<!--== About Us Area End ==-->

<!--== Partner Area End ==-->

<!--== Services Area End ==-->

<!--== Fun Fact Area Start ==-->
<!--== Fun Fact Area End ==-->

<!--== Choose Car Area Start ==-->
<section id="choose-car" class="section-padding">
    <div class="container">
        <div class="row">
            <!-- Section Title Start -->
            <div class="col-lg-12">
                <div class="section-title  text-center">
                    <h2>Data Prestasi Mahasiswa Undiksha</h2>
                </div>
            </div>
            <!-- Section Title End -->
        </div>

        <div class="row">
            <!-- Choose Area Content Start -->
            <div class="col-lg-12 ">
                <div class="choose-content-wrap">
                    <!-- Choose Area Tab Menu -->

                    <!-- Choose Area Tab Menu -->

                    <!-- Choose Area Tab content -->
                    <div class="tab-content" id="myTabContent">
                        <!-- Popular Cars Tab Start -->
                        <div class="tab-pane fade show active" id="popular_cars" role="tabpanel" aria-labelledby="home-tab">
                            <!-- Popular Cars Content Wrapper Start -->
                            <div class="popular-cars-wrap">
                                <!-- Filtering Menu -->
                                <!-- Filtering Menu -->

                                <!-- PopularCars Tab Content Start -->
                                <div class="row popular-car-gird">
                                    <!-- Single Popular Car Start -->
                                    <table id="example" class="table table-bordered table-hover">
                                        <thead>
                                            <tr class="text-center">
                                                <th>No</th>
                                                <th>Nama Kegiatan</th>
                                                <th>Kota Kegiatan</th>
                                                <th>Nama Mahasiswa</th>
                                                <th>Keterangan Prestasi</th>
                                                <th>Nama Pembimbing</th>
                                                <th>Tahun</th>
                                                <th colspan="3">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $no = 1;
                                            foreach ($prestasi as $val) { ?>
                                                <tr>
                                                    <td class="text-center"><?php echo $no++ ?></td>
                                                    <td><?= $val['nama_kegiatan']; ?></td>
                                                    <td><?= $val['kota']; ?></td>
                                                    <td><?= $val['name']; ?></td>
                                                    <td><?= $val['ket_prestasi']; ?></td>
                                                    <td><?= $val['nama_pembimbing']; ?></td>
                                                    <td><?= $val['tahun']; ?></td>
                                                    <td class="text-center"><a href="<?php echo base_url(); ?>index.php/Prestasi/detail/<?php echo $val['id_prestasi']; ?>">
                                                            <div class="btn btn-sm btn-success"><i class="fas fa-fw fa-search-plus"></i></div>
                                                        </a></td>
                                                    <td class="text-center"><a href="<?= site_url('Prestasi/update_register_prestasi/' . md5($val['id_prestasi'])) ?>">
                                                            <div class="btn btn-sm btn-primary"><i class="fas fa-fw fa-edit"></i></div>
                                                        </a></td>
                                                    <td class="text-center"><a href="<?= site_url('Prestasi/delete_prestasi/' . ($val['id_prestasi'])); ?>" onclick="return confirm('Anda yakin akan menghapus data ini ?');">
                                                            <div class="btn btn-sm btn-danger"><i class="fas fa-fw fa-trash"></i></div>
                                                        </a></td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>

                                    <!-- Single Popular Car End -->

                                    <!-- PopularCars Tab Content End -->
                                </div>
                                <!-- Popular Cars Content Wrapper End -->
                            </div>
                            <!-- Popular Cars Tab End -->

                            <!-- Newest Cars Content Wrapper End -->
                        </div>
                        <!-- Newest Cars Tab End -->

                        <!-- Office Map Tab -->
                        <div class="tab-pane fade" id="office_map" role="tabpanel" aria-labelledby="contact-tab">
                            <div class="map-area">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3650.6538067244583!2d90.37092511435942!3d23.79533919297639!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c0cce3251ab1%3A0x7a2aa979862a9643!2sJSoft!5e0!3m2!1sen!2sbd!4v1516771096779"></iframe>
                            </div>
                        </div>
                        <!-- Office Map Tab -->
                    </div>
                    <!-- Choose Area Tab content -->
                </div>
            </div>
            <!-- Choose Area Content End -->
        </div>
    </div>
</section>
<!--== Pricing Area Start ==-->
<!--== Pricing Area End ==-->

<!--== Articles Area End ==-->