#!/bin/bash

####################
## 設定項目
####################

# ユーザ名
user=xxxxxxxxxxxxx

# パスワード
# todo SAP と同じにしてあり、変わる可能性がある
passwd=xxxxxxxxxxxxx

# バーチャルホスト名
vhost=data-platform

# キュー名一覧
queues=(
  data-platform-api-orders-creates-queue-from
  data-platform-api-business-partner-exconf-queue

  data-platform-api-business-partner-exconf-customer-queue

  data-platform-api-business-partner-exconf-supplier-queue

  data-platform-api-product-master-exconf-queue

  data-platform-api-orders-creates-queue
  data-platform-api-orders-headers-creates-subfunc-queue
  data-platform-api-orders-items-creates-subfunc-queue
  data-platform-api-orders-pdf-creates-queue
  data-platform-api-orders-creates-session-control-queue
  data-platform-api-orders-items-creates-subfunc-session-control-queue

  data-platform-api-delivery-document-creates-queue
  data-platform-api-delivery-document-headers-creates-subfunc-queue
  data-platform-api-delivery-document-items-creates-subfunc-queue
  data-platform-api-delivery-document-pdf-creates-queue
  data-platform-api-delivery-document-creates-session-control-queue
  data-platform-api-delivery-document-items-creates-subfunc-session-control-queue

  data-platform-api-invoice-document-creates-queue
  data-platform-api-invoice-document-headers-creates-subfunc-queue
  data-platform-api-invoice-document-items-creates-subfunc-queue
  data-platform-api-invoice-document-pdf-creates-queue
  data-platform-api-invoice-document-creates-session-control-queue
  data-platform-api-invoice-document-items-creates-subfunc-session-control-queue

  data-platform-api-business-partner-creates-general-queue
  data-platform-api-business-partner-headers-creates-general-subfunc-queue
  data-platform-api-business-partner-items-creates-general-subfunc-queue
  data-platform-api-business-partner-creates-general-session-control-queue

  data-platform-api-product-tag-creates-queue

  data-platform-api-product-group-reads-queue
  data-platform-api-product-group-reads-session-control-queue

  data-platform-api-product-master-reads-queue
  data-platform-api-product-master-reads-session-control-queue

  data-platform-api-business-partner-reads-queue
  data-platform-api-business-partner-reads-session-control-queue

  data-platform-api-partner-function-creates-queue
  data-platform-api-partner-function-exconf-queue

  data-platform-api-orders-reads-queue
  data-platform-api-orders-reads-session-control-queue

  data-platform-api-product-tag-reads-queue

  data-platform-api-product-master-doc-creates-queue
  data-platform-api-product-master-doc-creates-session-control-queue

  data-platform-api-product-master-doc-reads-queue

  data-platform-api-barcode-generates-queue
  data-platform-api-barcode-generates-session-control-queue

  data-platform-api-product-stock-reads-queue
  data-platform-api-product-stock-reads-session-control-queue

  data-platform-api-plant-reads-queue
  data-platform-api-plant-reads-session-control-queue

  data-platform-api-business-partner-reads-general-queue
  data-platform-api-business-partner-reads-session-control-queue

  data-platform-api-delivery-document-reads-queue
  data-platform-api-delivery-document-reads-session-control-queue

  data-platform-api-request-reads-cache-manager-receive-queue
  data-platform-api-request-reads-cache-manager-queue

  data-platform-api-currency-exconf-queue

  data-platform-api-language-exconf-queue

  data-platform-api-incoterms-exconf-queue

  data-platform-api-quantity-unit-exconf-queue

  data-platform-api-country-exconf-queue

  data-platform-api-local-region-exconf-queue

  data-platform-api-payment-terms-exconf-queue

  data-platform-api-payment-method-exconf-queue

  data-platform-api-fin-inst-master-exconf-queue

  data-platform-api-storage-location-exconf-queue

  sql-update-kube

  data-platform-api-plant-exconf-queue

  data-platform-api-address-exconf-queue

  data-platform-api-supply-chain-relationship-exconf-queue

  data-platform-api-batch-master-record-exconf-queue

  data-platform-function-product-stock-availability-check-queue

  nestjs-data-connection-request-control-manager-consume

  data-platform-api-storage-bin-reads-queue
  data-platform-api-storage-bin-reads-session-control-queue

  data-platform-api-invoice-document-reads-queue
  data-platform-api-invoice-document-reads-session-control-queue

  data-platform-api-bill-of-material-reads-queue
  data-platform-api-bill-of-material-reads-session-control-queue

  convert-to-dpfm-orders-from-sap-sales-order-queue
  convert-to-dpfm-orders-from-orders-edi-for-smes-queue

  data-platform-api-delivery-document-csv-converter-queue
  data-platform-api-delivery-document-csv-converter-session-control-queue
  data-platform-api-orders-edi-for-smes-csv-converter-queue
  data-platform-api-orders-edi-for-smes-csv-converter-session-control-queue
  data-platform-api-delivery-notice-edi-for-smes-csv-converter-queue
  data-platform-api-delivery-notice-edi-for-smes-csv-converter-session-control-queue
  data-platform-api-orders-csv-converter-queue
  data-platform-api-orders-csv-converter-session-control-queue
  data-platform-api-orders-edi-for-voluntary-chain-smes-csv-converter-queue
  data-platform-api-orders-edi-for-voluntary-chain-smes-csv-converter-session-control-queue

  convert-to-dpfm-delivery-document-from-sap-inbound-delivery-queue
  convert-to-dpfm-delivery-document-from-sap-outbound-delivery-queue
  convert-to-dpfm-delivery-document-from-delivery-notice-edi-for-smes-queue

  data-platform-api-data-concatenation-queue

  convert-to-dpfm-delivery-document-from-delivery-notice-edi-for-voluntary-chain-smes-queue
  convert-to-dpfm-invoice-document-from-invoices-edi-for-smes-queue
  convert-to-dpfm-invoice-document-from-self-invoice-edi-for-smes-queue
  convert-to-dpfm-orders-from-orders-edi-for-voluntary-chain-smes-queue
  convert-to-dpfm-orders-from-salesforce-order-queue
  data-platform-api-data-concatenation-queue-test
  data-platform-api-delivery-notice-edi-for-voluntary-chain-smes-csv-converter-queue
  data-platform-api-delivery-notice-edi-for-voluntary-chain-smes-csv-converter-queue-test
  data-platform-api-delivery-notice-edi-for-voluntary-chain-smes-csv-converter-session-control-queue
  data-platform-api-new-delivery-document-headers-creates-subfunc-queue-test
  data-platform-api-new-invoice-document-items-creates-subfunc-queue-test
  data-platform-api-orders-headers-creates-subfunc-queue-test
  data-platform-api-orders-items-creates-subfunc-queue-test

  data-platform-api-quantity-unit-reads-queue
  data-platform-api-quantity-unit-reads-session-control-queue

  data-platform-api-payment-method-reads-queue
  data-platform-api-payment-method-reads-session-control-queue

  data-platform-api-payment-terms-reads-queue
  data-platform-api-payment-terms-reads-session-control-queue

  data-platform-api-currency-reads-queue
  data-platform-api-currency-reads-session-control-queue

  data-platform-api-currency-reads-queue
  data-platform-api-currency-reads-session-control-queue

  data-platform-api-orders-cancels-queue
  data-platform-api-orders-cancels-session-control-queue
  data-platform-api-orders-deletes-queue
  data-platform-api-orders-deletes-session-control-queue

  data-platform-api-delivery-document-cancels-queue
  data-platform-api-delivery-document-cancels-session-control-queue
  data-platform-api-delivery-document-deletes-queue
  data-platform-api-delivery-document-deletes-session-control-queue

  data-platform-api-invoice-document-cancels-queue
  data-platform-api-invoice-document-cancels-session-control-queue

  data-platform-api-production-order-headers-creates-subfunc-queue
  data-platform-api-production-order-headers-creates-subfunc-session-control-queue
  data-platform-api-production-order-items-creates-subfunc-queue
  data-platform-api-production-order-items-creates-subfunc-session-control-queue
  data-platform-api-production-order-creates-queue
  data-platform-api-production-order-creates-session-control-queue
  data-platform-api-production-order-reads-queue
  data-platform-api-production-order-reads-session-control-queue

  data-platform-function-invoice-confirmation-queue
  data-platform-function-invoice-confirmation-session-control-queue

  data-platform-api-product-master-deletes-queue
  data-platform-api-product-master-deletes-session-control-queue

  data-platform-api-bill-of-material-creates-queue
  data-platform-api-bill-of-material-creates-session-control-queue

  data-platform-api-product-master-creates-queue
  data-platform-api-product-master-creates-session-control-queue

  data-platform-api-product-type-exconf-queue
  data-platform-api-product-group-exconf-queue
  data-platform-api-industry-exconf-queue

  data-platform-api-production-version-reads-queue
  data-platform-api-production-version-reads-session-control-queue

  data-platform-api-product-stock-creates-queue
  data-platform-api-product-stock-creates-session-control-queue

  data-platform-api-operations-reads-queue
  data-platform-api-operations-reads-session-control-queue

  data-platform-api-equipment-master-reads-queue
  data-platform-api-equipment-master-reads-session-control-queue

  data-platform-api-equipment-type-reads-queue
  data-platform-api-equipment-type-reads-session-control-queue

  data-platform-api-work-center-reads-queue
  data-platform-api-work-center-reads-session-control-queue

  data-platform-api-quotations-reads-queue
  data-platform-api-quotations-reads-session-control-queue

  data-platform-api-supply-chain-rel-master-reads-queue
  data-platform-api-supply-chain-rel-master-reads-session-control-queue

  data-platform-api-price-master-reads-queue
  data-platform-api-price-master-reads-session-control-queue

)

default_user=guest
default_vhost=/
pod=$(kubectl get pod | grep -E '^rabbitmq-[0-9a-f]+-[0-9a-z]+ ' | sed -E 's/^([^ ]+) .*$/\1/')

rabbitmqctl() {
  kubectl exec "$pod" -it -- rabbitmqctl "$@"
}

rabbitmqadmin() {
  kubectl exec "$pod" -it -- rabbitmqadmin --username="$user" --password="$passwd" "$@"
}

# pod 内で RabbitMQ が起動するのを待つ
rabbitmqctl await_startup

# デフォルトユーザの削除
rabbitmqctl delete_user "$default_user"

# ユーザ作成
if rabbitmqctl add_user "$user" "$passwd"; then
  # 管理権限追加
  rabbitmqctl set_user_tags "$user" administrator

  # 既存のバーチャルホスト全部に対して
  rabbitmqctl list_vhosts --no-table-headers --quiet | while IFS= read -r v && v=${v%$'\r'}; do
    # アクセス権の設定
    rabbitmqctl set_permissions -p "$v" "$user" ".*" ".*" ".*" </dev/null 2>/dev/null
  done
fi

# 一旦 virtualhost ごと削除して再定義
# (キューを一旦全部消すため)
rabbitmqadmin delete vhost name="$vhost"
rabbitmqadmin declare vhost name="$vhost"

# キューの定義
for queue in "${queues[@]}"; do
  rabbitmqadmin declare queue --vhost="$vhost" name="$queue" durable=true
done
