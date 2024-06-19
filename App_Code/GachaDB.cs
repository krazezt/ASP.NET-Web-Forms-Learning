using System.Data.Entity;

namespace DatabaseContext {
    public class GachaDB : DbContext {
        public GachaDB()
            : base("name=GachaDB") {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Character> Characters { get; set; }
        public virtual DbSet<CharacterGallery> CharacterGalleries { get; set; }
        public virtual DbSet<Rarity> Rarities { get; set; }
    }
}