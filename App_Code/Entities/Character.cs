using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

public class Character {
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Id { get; set; }
    public string Name { get; set; }
    public int Price { get; set; }

    [ForeignKey("Rarity")]
    public int RarityId { get; set; }
    public Rarity Rarity { get; set; }
    public virtual ICollection<CharacterGallery> OwnedByAccounts { get; set; }
}