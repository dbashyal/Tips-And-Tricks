rsync -azvPr media 1.ent-abcdefghi-production-jklmnop@ssh.ap-3.magento.cloud:/app/abcdefghi/pub/
-r = recurssive
-a = recurssive archive + preserve sym links
-n = dry-run
-v = verbose
-z = compress
-P = combines the flags --progress and --partial
 --exclude=pattern_to_exclude
 rsync -azvPr --exclude=pattern_to_exclude media 1.ent-abcdefghi-production-jklmnop@ssh.ap-3.magento.cloud:/app/abcdefghi/pub/
