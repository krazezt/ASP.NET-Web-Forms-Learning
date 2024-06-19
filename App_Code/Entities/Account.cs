using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

public class Account {
    [Key]
    public string Id { get; set; }
    public int Balance { get; set; }
    public virtual ICollection<CharacterGallery> OwnedCharacters { get; set; }
}