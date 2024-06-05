# Two-factor Authentication

Two-factor authentication ("2FA") is a good way to improve the security
of an account, to make it less likely that an other person will manage
to log in instead of you.

Practically, it means storing a secret inside an *authenticator*
(usually your cell phone) and exchanging a code from the authenticator
when you try to log in.

This means an attacker needs *both* to have guessed (or found) your
password and to access (or steal) your authenticator, a more difficult
proposition than either one or the other.

## Requirements

> [!NOTE]
> These lists are just examples, they are not endorsements of any
> specific software.

If you don't already have one, you will need to choose an authenticator.

Phone-based authenticators are the easiest and most common so we will
assume you'll pick and install one on your phone, examples include
[Authy](https://authy.com/), [FreeOTP](https://freeotp.github.io/),
[Google
Authenticator](https://support.google.com/accounts/answer/1066447?hl=en),
[LastPass Authenticator](https://lastpass.com/auth/), [Microsoft
Authenticator](https://www.microsoft.com/en-gb/account/authenticator?cmp=h66ftb_42hbak),
...; password managers also commonly include `2FA (two-factor
authentication)` support e.g.
[1Password](https://support.1password.com/one-time-passwords/),
[Bitwarden](https://bitwarden.com/help/article/authenticator-keys/), ...

For the sake of demonstration we will be using Google Authenticator (not
because it is any good but because it is quite common).

## Setting up two-factor authentication

Once you have your authenticator of choice, go to the Konvergo ERP instance you
want to setup `2FA (two-factor authentication)`, then open `Preferences`
(or `My Profile`):

<figure>
<img src="2fa/preferences.png" class="align-center"
alt="2fa/preferences.png" />
</figure>

Open the `Account Security` tab, then click the
`Enable two-factor authentication` button:

<figure>
<img src="2fa/sec_tab.png" class="align-center" alt="2fa/sec_tab.png" />
</figure>

Because this is a security-sensitive action, you will need to input your
password:

<figure>
<img src="2fa/sec_enhanced.png" class="align-center"
alt="2fa/sec_enhanced.png" />
</figure>

After which you will see this screen with a barcode:

<figure>
<img src="2fa/totp_scan.png" class="align-center"
alt="2fa/totp_scan.png" />
</figure>

In most applications, you can simply *scan the barcode* via the
authenticator of your choice, the authenticator will then take care of
all the setup:

<figure>
<img src="2fa/scan_barcode.jpg" class="align-center"
alt="2fa/scan_barcode.jpg" />
</figure>

> [!NOTE]
> If you can not scan the screen (e.g. because you are doing this set-up
> on the same phone as the authenticator application), you can click the
> provided link, or copy the secret to manually set-up your
> authenticator:
>
> <figure>
> <img src="2fa/secret_visible.png" class="align-center"
> alt="2fa/secret_visible.png" />
> </figure>
>
> <figure>
> <img src="2fa/input_secret.png" class="align-center"
> alt="2fa/input_secret.png" />
> </figure>

Once this is done, the authenticator should display a *verification
code* with some useful identifying information (e.g. the domain and
login for which the code is):

<figure>
<img src="2fa/authenticator.png" class="align-center"
alt="2fa/authenticator.png" />
</figure>

You can now input the code into the `Verification Code` field, then
click the `Enable two-factor authentication` button.

Congratulation, your account is now protected by two-factor
authentication!

<figure>
<img src="2fa/totp_enabled.png" class="align-center"
alt="2fa/totp_enabled.png" />
</figure>

## Logging in

You should now `Log out` to follow along.

On the login page, input the username and password of the account for
which you set up `2FA (two-factor authentication)`, rather than
immediately enter Konvergo ERP you will now get a second log-in screen:

<figure>
<img src="2fa/2fa_input.png" class="align-center"
alt="2fa/2fa_input.png" />
</figure>

Get your authenticator, input the code it provides for the domain and
account, validate, and you're now in.

And that's it. From now on, unless you disable `2FA (two-factor
authentication)` you will have a two-step log-in process rather than the
old one-step process.

<div class="danger">

<div class="title">

Danger

</div>

Don't lose your authenticator, if you do, you will need an *Konvergo ERP
Administrator* to disable `2FA (two-factor
authentication)` on the account.

</div>
