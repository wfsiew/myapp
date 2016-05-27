include HomeHelper

class IpayController < ApplicationController

    protect_from_forgery except: [:resp, :bresp]

    def index
        merchantkey = 'apple'
        @MerchantCode = 'M00003'
        @PaymentId = ''
        @RefNo = 'A00000001'
        @Amount = '1.00'
        @Currency = 'MYR'
        status = '1'
        amt = @Amount.sub('.', '')
        k = merchantkey << @MerchantCode << @PaymentId << @RefNo << amt << @Currency << status
        @sign = IpayHelper.getsign k
        j = upper 'hello' # from HomeHelper
        p j
        render
    end

    def resp
        merchantcode = params[:MerchantCode]
        paymentid = params[:PaymentId]
        refno = params[:RefNo]
        amount = params[:Amount]
        currency = params[:Currency]
        remark = params[:Remark]
        transid = params[:TransId]
        authcode = params[:AuthCode]
        status = params[:Status].to_i
        errdesc = params[:ErrDesc]
        signature = params[:Signature]
        amt = amount.sub('.', '')

        x = 'Payment fail.'

        merchantkey = 'apple'
        if status == 1 then
            k = merchantkey << merchantcode << paymentid << refno << amt << currency << status
            sign = IpayHelper.getsign k
            if sign == signature then
                x = 'Thank you for payment.'
            end
        end

        @data = x
        render
    end

    def bresp
        p 'bresp'
        render plain: 'RECEIVEOK'
    end

end
