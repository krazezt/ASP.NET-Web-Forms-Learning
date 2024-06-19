using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

public class CharacterGallery {
    [Key, Column(Order = 0)]
    public string AccountId { get; set; }

    [Key, Column(Order = 1)]
    public string CharacterId { get; set; }

    public int Count { get; set; }

    public Account Account { get; set; }
    public Character Character { get; set; }
}