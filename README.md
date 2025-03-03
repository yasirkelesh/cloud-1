# Cloud-1

Bu proje, bir web sitesini (örneğin WordPress) ve gerekli Docker altyapısını bir bulut sağlayıcısında otomatik olarak dağıtmak için tasarlanmıştır. Her süreç (web sunucusu, veritabanı vb.) kendi konteynerinde çalışır ve dağıtım, Ansible ile otomatize edilerek tekrarlanabilir hale getirilir. Proje, genel bir bulut yaklaşımı sunsa da, AWS gibi popüler sağlayıcılarla uyumludur.

## Önkoşullar

Başlamadan önce aşağıdaki gereksinimlerin karşılandığından emin olun:
- **Ansible**: Sisteminizde kurulu olmalı (pip install ansible ile kurabilirsiniz).
- **Docker**: Bulut örneğinde Docker kullanılacağı için temel Docker bilgisi faydalı olabilir.
- **AWS CLI (isteğe bağlı)**: AWS kullanıyorsanız, aws configure ile kimlik bilgilerini ayarlayın.
- **SSH Anahtarı**: Bulut örneğine bağlanmak için bir anahtar çifti oluşturun.


## Kurulum


### Adımlar
1. **Depoyu Klonla**
   ```bash
   git clone <repository_url>
   cd cloud-1
2. **Bulut Sağlayıcı Kimlik Bilgilerini Ayarlayın**
    Örneğin, AWS için:
    ```bash
    aws configure
3. **Web Sitesi Kaynak Kodunu Hazırlayın** Dağıtılacak web sitesinin dosyalarını (örneğin WordPress dosyaları) bir dizine yerleştirin ve yolunu not edin.

4. **Dağıtım Betiğini Çalıştırın**
    Ansible playbook'u çalıştırarak dağıtımı başlatın:
    ```bash
    ansible-playbook deploy_app.yml
