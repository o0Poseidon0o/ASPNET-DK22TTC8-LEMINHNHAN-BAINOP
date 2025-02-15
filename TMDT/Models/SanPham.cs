//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TMDTLaptop.Models
{
    using System;
    using System.Collections.Generic;
    using System.Web.Mvc;

    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            this.ChiTietDonHang = new HashSet<ChiTietDonHang>();
            this.ChiTietGioHang = new HashSet<ChiTietGioHang>();
            this.ChiTietPhieuNhapKho = new HashSet<ChiTietPhieuNhapKho>();
        }
    
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        [AllowHtml]
        public string MoTa { get; set; }
        public decimal Gia { get; set; }
        public Nullable<decimal> GiaMoi { get; set; }
        public string HinhAnh { get; set; }
        public Nullable<int> MaHang { get; set; }
        public Nullable<int> MaDanhMuc { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
        public Nullable<bool> TrangThai { get; set; }
        public Nullable<int> SoLuong { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHang { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietGioHang> ChiTietGioHang { get; set; }
        public virtual DanhMucSanPham DanhMucSanPham { get; set; }
        public virtual HangSanPham HangSanPham { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhieuNhapKho> ChiTietPhieuNhapKho { get; set; }
    }
}
