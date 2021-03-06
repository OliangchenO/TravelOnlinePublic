namespace TravelOnline.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OL_Destination
    {
        public int Id { get; set; }

        public int? ParentId { get; set; }

        [StringLength(100)]
        public string DestinationName { get; set; }

        [StringLength(100)]
        public string Ename { get; set; }

        [StringLength(100)]
        public string PinYin { get; set; }

        [StringLength(50)]
        public string SortPinYin { get; set; }

        [StringLength(100)]
        public string DestinationUrl { get; set; }

        public byte? SortNum { get; set; }

        public int? MisClassId { get; set; }

        [StringLength(50)]
        public string ClassPath { get; set; }

        [StringLength(300)]
        public string ClassList { get; set; }

        public byte? ClassLevel { get; set; }

        [StringLength(50)]
        public string Dtype { get; set; }

        [StringLength(50)]
        public string map_x { get; set; }

        [StringLength(50)]
        public string map_y { get; set; }

        [StringLength(10)]
        public string map_size { get; set; }

        [StringLength(1)]
        public string hotflag { get; set; }
    }
}
